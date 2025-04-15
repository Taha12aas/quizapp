import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class TeacherName extends StatelessWidget {
  const TeacherName({
    super.key, required this.nameTeacher,
  });
  final String nameTeacher;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Bounceable(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: kOrange,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 5.0,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.edit,
              color: kBlack,
              size: 20,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        FittedBox(
          child: Text(
            nameTeacher,
            style: FontStyleApp.white18.copyWith(
              fontSize: getResponsiveText(context, 18),
            ),
          ),
        ),
        const SizedBox(
          width: 13,
        ),
      ],
    );
  }
}
