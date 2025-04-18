import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/class_subject_view.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/class_classification.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/custom_app_bar.dart';

class SubjectsView extends StatelessWidget {
  const SubjectsView({super.key});
  static String id = 'SubjectsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('المواد'),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView.builder(
          itemCount: kClassesPrimaryStage.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: ClassClassification(
                label: kClassesPrimaryStage[index],
                onTap: () {
                  Navigator.pushNamed(context, ClassSubjectView.id,
                      arguments: kClassesPrimaryStage[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
