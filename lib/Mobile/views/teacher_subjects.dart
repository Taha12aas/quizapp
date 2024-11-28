import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_teacher_subjects/list_view_buttin_class.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_teacher_subjects/card_subjects.dart';
import 'package:quizapp/custom_app_bar.dart';
import 'package:quizapp/font_style.dart';

class TeacherSubjects extends StatelessWidget {
  const TeacherSubjects({super.key});
  static String id = 'TeacherSubjects';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('المواد', true),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              ' : تصنيف حسب الصفوف ',
              style: FontStyleApp.textStyleOrangeBold25,
            ),
            ListViewButtonClass(),
            SizedBox(
              height: 20,
            ),
            CardSubjects()
          ],
        ),
      ),
    );
  }
}
