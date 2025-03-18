import 'package:flutter/material.dart';
import 'package:frontend/features/login/ui/widgets/custom_rounded_button.dart';


class ContinueSignButton extends StatelessWidget {
  const ContinueSignButton({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: customRoundedButton(
          text: "Continue",
          backgroundColor: Colors.blue,
          borderColor: Colors.transparent,
          padding: EdgeInsets.only(left: 20, right: 20),
          onPressed: onPressed,
          foregroundColor: Colors.white),
    );
  }
}
