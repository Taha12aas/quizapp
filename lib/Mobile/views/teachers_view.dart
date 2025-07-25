import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/teacher_subjects_info_view.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/class_classification.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/custom_app_bar.dart';

class TeachersView extends StatelessWidget {
  const TeachersView({super.key});
  static String id = 'TeachersView';
  @override
  Widget build(BuildContext context) {
    List<String> classes = kSchoolSubjects.keys.toList();
    return Scaffold(
      appBar: customAppBar('المدرسين'),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView.builder(
          itemCount: classes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: ClassClassification(
                label: classes[index],
                onTap: () {
                  Navigator.pushNamed(context, TeacherSubjectsInfoView.id,
                      arguments:classes[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
