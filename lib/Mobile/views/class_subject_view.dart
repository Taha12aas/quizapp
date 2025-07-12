import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/generated_questions_view.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/class_classification.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/custom_app_bar.dart';

class ClassSubjectView extends StatelessWidget {
  const ClassSubjectView({super.key});
  static String id = 'ClassSubjectView';
  @override
  Widget build(BuildContext context) {
    final String className =
        ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: customAppBar(className),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView.builder(
          itemCount: kSchoolSubjects[className]!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: ClassClassification(
                label: kSchoolSubjects[className]![index],
                onTap: () {
                  Navigator.pushNamed(context, GeneratedQuestionsView.id,
                      arguments: [kSchoolSubjects[className]![index], className]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
