import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/generated_question.dart/questions_list.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/button_class.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/teacher_profile_card.dart';
import 'package:quizapp/utils/custom_app_bar.dart';

class GeneratedQuestionsView extends StatelessWidget {
  const GeneratedQuestionsView({super.key});
  static String id = 'GeneratedSubject';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('رياضيات'),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TeacherProfileCard(
                text: 'salimo',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 60,
                      child: ButtonClass(
                        text: 'تكميلي',
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: ButtonClass(
                        text: 'فصل ثاني',
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: ButtonClass(
                        text: 'فصل اول',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Expanded(
                child: QuestionsList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
