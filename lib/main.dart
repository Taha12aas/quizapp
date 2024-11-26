import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/home_view.dart';
import 'package:quizapp/Mobile/views/log_in_view.dart';
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
        LogInView.id: (context) => const LogInView(),
        TeachersView.id: (context) => const TeachersView(),
      },
      theme: ThemeData().copyWith(scaffoldBackgroundColor: kBackGround),
      debugShowCheckedModeBanner: false,
      initialRoute: TeachersView.id,
    );
  }
}
