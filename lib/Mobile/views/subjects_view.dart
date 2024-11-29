import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/list_view_buttin_class.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/card_subjects.dart';
import 'package:quizapp/custom_app_bar.dart';
import 'package:quizapp/font_style.dart';

class Subjects extends StatelessWidget {
  const Subjects({super.key});
  static String id = 'TeacherSubjects';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('المواد', true),
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
              height: 20,
            ),
            CardSubjects(
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
