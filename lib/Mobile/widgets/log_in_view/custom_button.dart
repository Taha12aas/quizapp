import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/font_style.dart';
import 'package:quizapp/responsive_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed, required this.label,
  });
  final VoidCallback onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.login,
          color: kOrangeColor,
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.orange[50],
          side: const BorderSide(color: kOrangeColor, width: 2),
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        onPressed: onPressed,
        label: Text(
          label,
          style: FontStyleApp.textFieldPadding.copyWith(
            fontSize: getResponsiveText(context, 18),
          ),
        ),
      ),
    );
  }
}
