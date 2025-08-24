import 'package:flutter/material.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class CustomButtonIcon extends StatelessWidget {
  const CustomButtonIcon({
    super.key,
    required this.onPressed,
    required this.label,
  });
  final VoidCallback onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.orange[50],
          side: const BorderSide(color: kOrange, width: 2),
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 10),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: FontStyleApp.orange18.copyWith(
            fontSize: getResponsiveText(context, 18),
          ),
        ),
      ),
    );
  }
}
