import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/features/login/logic/cubit/login_cubit.dart';
import 'package:frontend/features/login/logic/cubit/login_state.dart';
import 'package:frontend/features/login/ui/widgets/custom_rounded_button.dart';
import 'package:frontend/features/login/ui/widgets/email_text_field.dart';
import 'package:frontend/features/login/ui/widgets/loading_overlay.dart';
import 'package:frontend/features/login/ui/widgets/password_text_field.dart';
import 'package:frontend/routing/routes.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
        } else if (state is LoginSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("login success")));
          Navigator.pushReplacementNamed(context, Routes.homeScreen);
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "${state.error}",
              style: TextStyle(color: Colors.blue),
            ),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: LoadingIndicatorOverlay(
            inAsyncCall: state is LoginLoading,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.sp, horizontal: 24.sp),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      key: Key("join"),
                      text: TextSpan(
                        children: [
                          TextSpan(text: "or "),
                          TextSpan(
                            semanticsLabel: "join",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                    context, Routes.signUpScreen);
                              },
                            text: "Sign up",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EmailTextFormField(
                              key: Key("login_email_textfield"),
                              emailController: _emailController),
                          const SizedBox(height: 15),
                          PasswordTextFormField(
                              key: Key("login_password_textfield"),
                              passwordController: _passwordController),
                          const SizedBox(height: 10),
                          const SizedBox(height: 20),
                          SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: customRoundedButton(
                                  key: Key("login_continue_button"),
                                  text: "Continue",
                                  backgroundColor: Colors.blue,
                                  borderColor: Colors.transparent,
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      final email = _emailController.text;
                                      final password = _passwordController.text;

                                      context
                                          .read<LoginCubit>()
                                          .login(email, password);
                                    }
                                  },
                                  foregroundColor: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
