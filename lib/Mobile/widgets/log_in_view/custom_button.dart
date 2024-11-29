import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/font_style.dart';
import 'package:quizapp/responsive_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.login,
        color: kOrangeColor,
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.orange[50],
        side: const BorderSide(color: kOrangeColor, width: 2),
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 23),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      onPressed: () {},
      label: Text(
        'تسجيل الدخول',
        style: FontStyleApp.textFieldPadding.copyWith(
          fontSize: getResponsiveText(context, 18),
        ),
      ),
    );
  }
}
