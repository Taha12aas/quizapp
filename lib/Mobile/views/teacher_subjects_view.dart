import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/list_view_card_subjects.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/teacher_profile_card.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/custom_app_bar.dart';

class TeacherSubjectsView extends StatefulWidget {
  const TeacherSubjectsView({super.key});
  static String id = 'TeacherSubjectsView';

  @override
  State<TeacherSubjectsView> createState() => _TeacherSubjectsViewState();
}

class _TeacherSubjectsViewState extends State<TeacherSubjectsView> {
  late String teacherName;
  @override
  void didChangeDependencies() {
    teacherName = ModalRoute.of(context)!.settings.arguments.toString();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        '$teacherName مواد المدرس',
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TeacherProfileCard(
              text: 'salimo',
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListViewCardSubjects(
                subjects: kPrimaryStage,
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
