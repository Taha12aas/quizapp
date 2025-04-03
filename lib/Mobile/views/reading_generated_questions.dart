import 'package:flutter/material.dart';
import 'package:quizapp/Cubits/cubitSubject/cubit_subject.dart';
import 'package:quizapp/Mobile/widgets/ReadingView/question_and_answer.dart';
import 'package:quizapp/utils/custom_app_bar.dart';

class ReadingGeneratedQuestionsView extends StatefulWidget {
  const ReadingGeneratedQuestionsView({super.key});
  static String id = 'ReadingGeneratedQuestions';
  @override
  State<ReadingGeneratedQuestionsView> createState() =>
      _ReadingGeneratedQuestionsViewState();
}

class _ReadingGeneratedQuestionsViewState
    extends State<ReadingGeneratedQuestionsView> {
  @override
  Widget build(BuildContext context) {
    List subjectInfo = ModalRoute.of(context)!.settings.arguments as List;
    List<dynamic> course = [];
    for (var i = 0; i < CubitSubject.result.length; i++) {
      if (subjectInfo[0] == CubitSubject.result[i]['name_sabject'] &&
          subjectInfo[1] == CubitSubject.result[i]['class'] &&
          subjectInfo[2] == CubitSubject.result[i]['courses_date'] &&
          subjectInfo[3] == CubitSubject.result[i]['season_subject'] &&
          subjectInfo[4] == CubitSubject.result[i]['generate_time']) {
        course.addAll(CubitSubject.result[i]['courses']);
      }
    }
    return Scaffold(
      appBar: customAppBar(subjectInfo[0]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            QuestionAndAnswer(
              data: course,
              isIcon: false,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
