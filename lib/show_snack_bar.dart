import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/font_style.dart';
import 'package:quizapp/responsive_text.dart';

SnackBar showSnackBar(BuildContext context,String content) {
  return SnackBar(
    padding: const EdgeInsets.symmetric(vertical: 6),
    duration: const Duration(seconds: 1),
    shape: const RoundedRectangleBorder(
      side: BorderSide(color: kOrangeColor),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        const CircleAvatar(
          backgroundColor: Color.fromARGB(255, 166, 164, 164),
          child: Icon(
            Icons.check,
            color: kOrangeColor,
          ),
        ),
        const Spacer(),
        Text(
          content,
          style: FontStyleApp.snakBarLabel.copyWith(
            fontSize: getResponsiveText(context, 15),
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    ),
  );
}
