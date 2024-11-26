import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/home_view.dart';

void main(List<String> args) {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
