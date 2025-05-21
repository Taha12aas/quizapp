import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/teacher_subject_generated_view.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/card_subjects.dart';
import 'package:quizapp/models/teacher_model.dart';

class TeacherSubjectsListView extends StatelessWidget {
  const TeacherSubjectsListView({
    super.key,
    required this.subjects,
    required this.classTeacher,
    required this.teacher,
  });
  final List subjects;
  final List classTeacher;
  final TeacherModel teacher;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CardSubjects(
            classSubject: classTeacher[index],
            subject: subjects[index],
            onTap: () {
              Navigator.pushNamed(context, TeacherSubjectGeneratedView.id,
                  arguments: [teacher, classTeacher[index], subjects[index]]);
            },
          ),
        );
      },
    );
  }
}
