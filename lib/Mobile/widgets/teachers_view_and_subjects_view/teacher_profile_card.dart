import 'package:flutter/material.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class TeacherProfileCard extends StatelessWidget {
  const TeacherProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.6,
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.001),
      decoration: BoxDecoration(
        color: kAshenColor,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'ريم سواس',
                  style: FontStyleApp.textStylewite15.copyWith(
                    fontSize: getResponsiveText(context, 15),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  ' : الاسم',
                  style: FontStyleApp.textStyleOrange15.copyWith(
                    fontSize: getResponsiveText(context, 15),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage('assets/images/TeachersTaha.jpg'),
          ),
        ],
      ),
    );
  }
}
