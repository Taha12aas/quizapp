import 'package:flutter/material.dart';
import 'package:quizapp/font_style.dart';
import 'package:quizapp/responsive_text.dart';

class RegisterOrLogIn extends StatelessWidget {
  const RegisterOrLogIn({
    super.key,
    required this.label1,
    required this.label2, required this.onPressed,
  });
  final String label1;
  final String label2;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            label2,
            style: FontStyleApp.textFieldPadding.copyWith(
              fontSize: getResponsiveText(context, 12),
            ),
          ),
        ),
        Text(
          label1,
          style: FontStyleApp.labels.copyWith(
            fontSize: getResponsiveText(context, 12),
          ),
        ),
      ],
    );
  }
}
