
import 'package:flutter/material.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class TeacherName extends StatelessWidget {
  const TeacherName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.app_registration_rounded,
              color: kOrangeColor,
            )),
        Text(
          'طه الفاخوري',
          style: FontStyleApp.teacherName.copyWith(
            fontSize: getResponsiveText(context, 18),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
