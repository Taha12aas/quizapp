import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/column_subject_check.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/column_teacher_info.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/container_teache_subjects_display.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:quizapp/Mobile/widgets/teather_profile_view/teacher_name.dart';
import 'package:quizapp/Mobile/widgets/teather_profile_view%20copy/teacher_photor.dart';
import 'package:quizapp/utils/custom_app_bar.dart';

class TeacherProfileView extends StatelessWidget {
  const TeacherProfileView({super.key});
  static String id = 'TeacherProfile';
  static const List<String> itemsClass = [
    'صف أول',
    'صف ثاني',
    'صف ثالث',
    'صف رابع',
    'صف خامس',
    'صف سادس'
  ];
  static const List<String> itemsSubject = [
    'علوم',
    'رياضيات',
    'انكليزي',
    'عربي',
    'فرنسي',
    'تاريخ',
    'جغرافيا'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('ملف الأستاذ'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                TeacherPhoto(
                  image: '',
                  onPressed: () {},
                  selectedImage: File(''),
                ),
                const TeacherName(),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  children: [
                    ColumnTeacherInfo(
                      labelText: ': العنوان',
                      hintText: 'جنوب الملعب',
                      iconData: FontAwesomeIcons.locationDot,
                      horizntalSize: 64,
                    ),
                    ColumnTeacherInfo(
                      labelText: ': رقم الهاتف',
                      hintText: '0962449054',
                      iconData: FontAwesomeIcons.phone,
                      horizntalSize: 89,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomButton(title: 'تغير كلمة المرور'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const ColumnSubjectCheck(
                      horizntalSize: 52,
                      itemsSubject: itemsSubject,
                      title: ': المادة',
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.022,
                    ),
                    const ColumnSubjectCheck(
                      horizntalSize: 50,
                      itemsSubject: itemsClass,
                      title: ': الصف',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomButton(title: 'إضافة مادة'),
                const SizedBox(
                  height: 20,
                ),
                const ContainerTeacherSubjectsDisplay(
                  classes: ['اول', 'ثاني'],
                  subjects: ['علوم', 'رياضيات'],
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomButton(title: 'حفظ'),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
