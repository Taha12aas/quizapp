import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/Cubits/cubitTeacher/cubit_teacher.dart';
import 'package:quizapp/Mobile/views/home_view.dart';
import 'package:quizapp/Mobile/widgets/teather_profile_view%20copy/header_row.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class ContainerTeacherSubjectsDisplay extends StatelessWidget {
  const ContainerTeacherSubjectsDisplay({
    super.key,
    required this.classes,
    required this.subjects,
    required this.nameTeacher, required this.height,
  });

  final List<dynamic> classes;
  final List<dynamic> subjects;
  final String nameTeacher;
  final double height;
  @override
  Widget build(BuildContext context) {
    List<dynamic> newClasses = [];
    List<dynamic> newSubjects = [];
    return Container(
      margin: EdgeInsets.zero,
      width: MediaQuery.of(context).size.width * 0.99,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17),
        child: Column(
          children: [
            Container(
              color: kOrange,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: HeaderRow(),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Table(
                    border:
                        TableBorder.all(color: Colors.grey.withOpacity(0.2)),
                    columnWidths: const {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                    },
                    children: List.generate(subjects.length, (index) {
                      final color =
                          index.isEven ? kWhite : const Color(0xffE4E4E4);
                      return TableRow(
                        decoration: BoxDecoration(
                          color: color,
                        ),
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(
                                          'حذف مادة',
                                          textAlign: TextAlign.right,
                                        ),
                                        content: Text(
                                            textAlign: TextAlign.right,
                                            ' هل أنت متأكد من حذف مادة ${subjects[index]}؟'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('إلغاء'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              for (var i = 0;
                                                  i < subjects.length;
                                                  i++) {
                                                if (i != index) {
                                                  newSubjects.add(subjects[i]);
                                                  newClasses.add(classes[i]);
                                                }
                                              }
                                              context
                                                  .read<CubitTeacher>()
                                                  .updateUsers(
                                                      'classes_subjects',
                                                      nameTeacher, {
                                                'صف': newClasses,
                                                'مواد': newSubjects
                                              });
                                              Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                HomeView.id,
                                                (route) => false,
                                              );
                                            },
                                            child: const Text('حذف',
                                                style: TextStyle(color: kred)),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  'حذف',
                                  style: FontStyleApp.orange10.copyWith(
                                    fontSize: getResponsiveText(context, 18),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                subjects[index].toString(),
                                style: FontStyleApp.blackBold16.copyWith(
                                  fontSize: getResponsiveText(context, 18),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                classes[index],
                                style: FontStyleApp.blackBold16.copyWith(
                                  fontSize: getResponsiveText(context, 18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
