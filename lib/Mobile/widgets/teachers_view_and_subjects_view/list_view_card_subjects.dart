import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/generated_questions_view.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/card_subjects.dart';

class ListViewCardSubjects extends StatelessWidget {
  const ListViewCardSubjects({
    super.key,
    required this.subjects,
    required this.onTap,
  });
  final List<String> subjects;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CardSubjects(
            subject: subjects[index],
            teacherImag: 'assets/images/Teachers.png',
            onTap: () {
              Navigator.pushNamed(context, GeneratedQuestionsView.id);
            },
          ),
        );
      },
    );
  }
}
