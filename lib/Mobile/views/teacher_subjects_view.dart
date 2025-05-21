import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/teacher_profile_view.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/teacher_profile_card.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/teacher_subjects_list_view.dart';
import 'package:quizapp/models/teacher_model.dart';
import 'package:quizapp/utils/custom_app_bar.dart';

class TeacherSubjectsView extends StatefulWidget {
  const TeacherSubjectsView({super.key});
  static String id = 'TeacherSubjectsView';

  @override
  State<TeacherSubjectsView> createState() => _TeacherSubjectsViewState();
}

class _TeacherSubjectsViewState extends State<TeacherSubjectsView> {
  late TeacherModel teacher;
  @override
  void didChangeDependencies() {
    teacher = ModalRoute.of(context)!.settings.arguments as TeacherModel;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        '${teacher.name} مواد المدرس',
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TeacherProfileCard(
              url: teacher.photo,
              text: teacher.name,
              onTap: () {
        Navigator.pushNamed(context, TeacherProfileView.id,arguments:teacher );
      },
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: TeacherSubjectsListView(
                subjects: teacher.classesSubjects['مواد'],
                teacher: teacher,
                classTeacher: teacher.classesSubjects['صف'],
              ),
            )
          ],
        ),
      ),
    );
  }
}
