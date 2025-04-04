import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/generated_question.dart/year_questions.dart';
import 'package:quizapp/models/subjects_generated_model.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList({
    super.key,
    required this.subjectsInfo,
  });
  final List<SubjectsGeneratedModel> subjectsInfo;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subjectsInfo.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: YearQuestions(
            year: subjectsInfo[index].coursesDate,
            session: subjectsInfo[index].seasonSubject,
          ),
        );
      },
    );
  }
}
