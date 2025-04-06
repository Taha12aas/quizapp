import 'package:flutter/material.dart';
import 'package:quizapp/utils/custom_app_bar.dart';

class ClassTeachersView extends StatelessWidget {
  const ClassTeachersView({super.key});
  static String id = 'ClassTeachersView';
  @override
  Widget build(BuildContext context) {
    String calssTeacher = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: customAppBar('مدرسين الصف ال$calssTeacher'),
    );
  }
}
