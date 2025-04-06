import 'package:flutter/material.dart';
import 'package:quizapp/Cubits/cubitSubject/cubit_subject.dart';
import 'package:quizapp/Mobile/widgets/generated_question.dart/questions_list.dart';
import 'package:quizapp/models/subjects_generated_model.dart';
import 'package:quizapp/utils/custom_app_bar.dart';

class GeneratedQuestionsView extends StatelessWidget {
  const GeneratedQuestionsView({super.key});
  static String id = 'GeneratedQuestionsView';
  @override
  Widget build(BuildContext context) {
    List<SubjectsGeneratedModel> subjectsInfo = [];
    final List<String> info =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    for (var i = 0; i < CubitSubject.subjectsCount.length; i++) {
      if (info[1] == CubitSubject.subjectsCount[i].classSabject &&
          info[0] == CubitSubject.subjectsCount[i].nameSubject) {
        subjectsInfo.add(CubitSubject.subjectsCount[i]);
      }
    }
    return Scaffold(
      appBar: customAppBar(info[0]),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Expanded(
                child: QuestionsList(
                  subjectsInfo: subjectsInfo,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
