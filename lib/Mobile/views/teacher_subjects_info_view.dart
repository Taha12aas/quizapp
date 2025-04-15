import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quizapp/Cubits/cubitTeacher/cubit_teacher.dart';
import 'package:quizapp/Mobile/views/teacher_subjects_view.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/teacher_info.dart';
import 'package:quizapp/models/teacher_model.dart';
import 'package:quizapp/utils/custom_app_bar.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class TeacherSubjectsInfoView extends StatefulWidget {
  const TeacherSubjectsInfoView({super.key});
  static String id = 'TeacherSubjectsInfoView';
  @override
  State<TeacherSubjectsInfoView> createState() =>
      _TeacherSubjectsInfoViewState();
}

class _TeacherSubjectsInfoViewState extends State<TeacherSubjectsInfoView> {
  late String calssTeacher;
  List<TeacherModel> teachers = [];
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _isInit = false;
      calssTeacher = ModalRoute.of(context)!.settings.arguments.toString();
      for (var i = 0; i < CubitTeacher.teachers.length; i++) {
        List<dynamic> classLength = CubitTeacher.teachers[i].classesSubjects['صف'];
        for (var j = 0; j < classLength.length; j++) {
          if (classLength[j] == calssTeacher) {
            log('Addddd');
            teachers.add(CubitTeacher.teachers[i]);
            break;
          }
        }
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    log('buidl');
    return Scaffold(
      appBar: customAppBar('مدرسين الصف ال$calssTeacher'),
      body: teachers.isEmpty
          ? Center(
              child: Text(
                'لا يوجد مدرسين',
                style: FontStyleApp.orange30.copyWith(
                  fontSize: getResponsiveText(
                    context,
                    30,
                  ),
                ),
              ),
            )
          : ListView.builder(
              itemCount: teachers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                  child: TeacherInfo(
                    onTap: () {
                      log(teachers.length.toString());
                      Navigator.pushNamed(context, TeacherSubjectsView.id,
                          arguments: teachers[index].name);
                    },
                    image: teachers[index].photo,
                    teacherName: teachers[index].name,
                  ),
                );
              },
            ),
    );
  }
}
