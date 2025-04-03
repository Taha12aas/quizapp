import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/class_classification.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/custom_app_bar.dart';

class SubjectsView extends StatefulWidget {
  const SubjectsView({super.key});
  static String id = 'SubjectsView';

  @override
  State<SubjectsView> createState() => _SubjectsViewState();
}

class _SubjectsViewState extends State<SubjectsView> {
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
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
