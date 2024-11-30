import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/search_view.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/list_view_card_subjects.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/teacher_profile_card.dart';
import 'package:quizapp/utils/custom_app_bar.dart';

class TeacherSubjects extends StatelessWidget {
  const TeacherSubjects({super.key});
  static String id = 'TeacherSubjects';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('مواد المدرس', true,() {
        Navigator.pushNamed(context, SearchView.id);
      },),
      body: const Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TeacherProfileCard(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListViewCardSubjects(),
            )
          ],
        ),
      ),
    );
  }
}
