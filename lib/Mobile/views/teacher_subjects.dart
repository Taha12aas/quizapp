import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/home_view/list_view_buttin_class.dart';
import 'package:quizapp/Mobile/widgets/teachers_view/card_subjects.dart';
import 'package:quizapp/font_style.dart';

class TeacherSubjects extends StatelessWidget {
  const TeacherSubjects({super.key});
  static String id = 'TeacherSubjects';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              ' : تصنيف حسب الصفوف ',
              style: FontStyleApp.textStyleOrangeBold25,
            ),
            const ListViewButtonClass(),
            const SizedBox(
              height: 30,
            ),
            CardSubjects(screenHeight: screenHeight, screenWidth: screenWidth)
          ],
        ),
      ),
    );
  }
}
