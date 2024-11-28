import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/home_view/teacher_card.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_teacher_subjects/list_view_buttin_class.dart';
import 'package:quizapp/custom_app_bar.dart';
import 'package:quizapp/font_style.dart';

class TeachersView extends StatelessWidget {
  const TeachersView({super.key});
  static String id = 'TeachersView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('المدرسين', true),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 8, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              ' : تصنيف حسب الصفوف ',
              style: FontStyleApp.textStyleOrangeBold25,
            ),
            const ListViewButtonClass(),
            const SizedBox(
              height: 15,
            ),
            TeacherCard(
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
