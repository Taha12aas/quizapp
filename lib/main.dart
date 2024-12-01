import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/add_teacher.dart';
import 'package:quizapp/Mobile/views/home_view.dart';
import 'package:quizapp/Mobile/views/log_in_view.dart';
import 'package:quizapp/Mobile/views/register_view.dart';
import 'package:quizapp/Mobile/views/subjects_view.dart';
import 'package:quizapp/Mobile/views/teacher_subjects_view.dart';
import 'package:quizapp/Mobile/views/teachers_view.dart';
import 'package:quizapp/constants.dart';

void main(List<String> args) {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeView.id: (context) => const HomeView(),
        RegisterView.id: (context) => const RegisterView(),
        LogInView.id: (context) => const LogInView(),
        AddTeacher.id: (context) => const AddTeacher(),
        SubjectsView.id: (context) => const SubjectsView(),
        TeacherSubjects.id: (context) => const TeacherSubjects(),
        TeachersView.id: (context) => const TeachersView(),
      },
      theme:
          ThemeData(scaffoldBackgroundColor: kBackGround, fontFamily: 'Exo2'),
      debugShowCheckedModeBanner: false,
      initialRoute: LogInView.id,
    );
  }
}
