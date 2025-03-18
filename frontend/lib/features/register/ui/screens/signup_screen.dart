import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:frontend/features/login/ui/widgets/email_text_field.dart';
import 'package:frontend/features/login/ui/widgets/loading_overlay.dart';
import 'package:frontend/features/login/ui/widgets/password_text_field.dart';
import 'package:frontend/features/register/data/models/register_request_model.dart';
import 'package:frontend/features/register/logic/cubit/signup_cubit.dart';
import 'package:frontend/features/register/ui/widgets/continue_sign_button.dart';
import 'package:frontend/features/register/ui/widgets/firstname_text_field.dart';
import 'package:frontend/features/register/ui/widgets/lastname_text_field.dart';
import 'package:frontend/routing/routes.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          // Show loading indicator
        } else if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Signup success")));
          // Navigator.pushReplacementNamed(context, Routes.homeScreen);
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              state.error,
              style: TextStyle(color: Colors.red),
            ),
          ));
        }
      },
      builder: (context, state) {
        return LoadingIndicatorOverlay(
          inAsyncCall: state is RegisterLoading,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.sp, horizontal: 24.sp),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "or "),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                    context, Routes.loginScreen);
                              },
                            text: "Sign in",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue,
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
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FirstnameTextFormField(
                              firstNameController: _firstNameController),
                          const SizedBox(height: 15),
                          LastnameTextFormField(
                              lastNameController: _lastNameController),
                          const SizedBox(height: 15),
                          EmailTextFormField(emailController: _emailController),
                          const SizedBox(height: 15),
                          PasswordTextFormField(
                              passwordController: _passwordController),
                          const SizedBox(height: 10),
                          const SizedBox(height: 20),
                          ContinueSignButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<RegisterCubit>().register(
                                      RegisterRequestModel(
                                          firstname: _firstNameController.text,
                                          lastname: _lastNameController.text,
                                          email: _emailController.text,
                                          password: _passwordController.text),
                                    );
                              }
                            },
                          ),
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
