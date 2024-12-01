import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/teacher_subjects_view.dart';
import 'package:quizapp/Mobile/widgets/home_view/teacher_card.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/list_view_buttin_class.dart';
import 'package:quizapp/utils/custom_app_bar.dart';
import 'package:quizapp/utils/font_style.dart';

class TeachersView extends StatelessWidget {
  const TeachersView({super.key});
  static String id = 'TeachersView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('المدرسين', true, context),
      body: Padding(
        padding: const EdgeInsets.all(18),
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
              subject: 'رياضيات',
              teacherName: 'طه حوراني',
              onTap: () {
                Navigator.pushNamed(context, TeacherSubjects.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
