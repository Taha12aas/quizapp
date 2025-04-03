import 'package:flutter/material.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class RowText extends StatelessWidget {
  const RowText({
    super.key,
    required this.classAndSubject,
    required this.screenWidth,
    required this.subjectName,
  });

  final String classAndSubject;
  final double screenWidth;
  final String subjectName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            classAndSubject,
            style: FontStyleApp.orange15.copyWith(
              fontSize: getResponsiveText(context, 15),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Flexible(
          child: Text(
            subjectName,
            style: FontStyleApp.white15.copyWith(
              fontSize: getResponsiveText(context, 14),
            ),
          ),
        ),
      ],
    );
  }
}
