import 'package:flutter/material.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class RowText extends StatelessWidget {
  const RowText({
    super.key,
    required this.classAndSubject,
    required this.subjectName, required this.mainAxisAlignment,
  });

  final String classAndSubject;
  final String subjectName;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Flexible(
          child: Text(
            classAndSubject,
            style: FontStyleApp.orange15.copyWith(
              fontSize: getResponsiveText(context, 14),
            ),
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
