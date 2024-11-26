import 'package:flutter/material.dart';
import 'package:quizapp/custom_app_bar.dart';

class AddTeacher extends StatelessWidget {
  const AddTeacher({super.key});

  static String id = 'AddTeacher';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:customAppBar('إضافة مدرس',false),
    );
  }
}