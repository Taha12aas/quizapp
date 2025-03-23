import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/generated_question.dart/year_questions.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: YearQuestions(year: 'دورة 2020'),
        );
      },
    );
  }
}
