import 'package:flutter/material.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class CustomButtonIcon extends StatelessWidget {
  const CustomButtonIcon({
    super.key,
    required this.onPressed,
    required this.label,
    required this.iconData,
  });
  final VoidCallback onPressed;
  final String label;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(
          iconData,
          color: kOrange,
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.orange[50],
          side: const BorderSide(color: kOrange, width: 2),
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        onPressed: onPressed,
        label: Text(
          label,
          style: FontStyleApp.orange18.copyWith(
            fontSize: getResponsiveText(context, 20),
          ),
        ),
      ),
    );
  }
}
