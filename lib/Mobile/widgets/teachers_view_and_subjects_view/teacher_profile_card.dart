
import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/font_style.dart';

class TeacherProfileCard extends StatelessWidget {
  const TeacherProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: kAshenColor,
        borderRadius: BorderRadius.circular(60),
      ),
      child: const Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('ريم سواس', style: FontStyleApp.textStylewite15),
                Text(' : الاسم', style: FontStyleApp.textStyleOrange15),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 30.0,
            backgroundImage:
                AssetImage('assets/images/TeachersTaha.jpg'),
          ),
        ],
      ),
    );
  }
}