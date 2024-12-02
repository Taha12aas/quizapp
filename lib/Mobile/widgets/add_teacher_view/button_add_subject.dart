import 'package:flutter/material.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class ButtonAddSubjectAddsave extends StatelessWidget {
  const ButtonAddSubjectAddsave({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: kOrangeColor,
          minimumSize: Size(MediaQuery.of(context).size.width * 0.96,
              MediaQuery.of(context).size.height * 0.068)),
      child: Text(
        title,
        style: FontStyleApp.textStylewite15
            .copyWith(fontSize: getResponsiveText(context, 20)),
      ),
    );
  }
}
