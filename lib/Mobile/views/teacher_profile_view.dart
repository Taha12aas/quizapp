import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/teather_profile_view/photo_teacher.dart';
import 'package:quizapp/utils/custom_app_bar.dart';

class TeacherProfileView extends StatelessWidget {
  const TeacherProfileView({super.key});
  static String id = 'TeacherProfile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('ملف الأستاذ'),
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            PhotoTeacher(),

          ],
        ),
      ),
    );
  }
}
