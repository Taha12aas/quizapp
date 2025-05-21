import 'package:flutter/material.dart';
import 'package:quizapp/Cubits/cubitTeacher/cubit_teacher.dart';
import 'package:quizapp/Mobile/views/teacher_subjects_view.dart';
import 'package:quizapp/Mobile/widgets/home_view/DropDownSearch/teacher_card_drop_down_search_item.dart';
import 'package:quizapp/models/teacher_model.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';

void showCustomDropDownSearch(BuildContext context) {
  showModalBottomSheet(
    scrollControlDisabledMaxHeightRatio: 900,
    backgroundColor: kBackGround,
    context: context,
    shape: const RoundedRectangleBorder(
      side: BorderSide(color: kOrange),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    builder: (BuildContext context) {
      TextEditingController searchController = TextEditingController();
      List<TeacherModel> teachers =
          List.from(CubitTeacher.teachers); // نسخة من القائمة الأصلية

      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'ابحث عن المدرس',
                    style: FontStyleApp.orange18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'ابحث',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        teachers = CubitTeacher.teachers
                            .where((teacher) => teacher.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                  child: SizedBox(
                    height: 500,
                    child: ListView.builder(
                      itemCount: teachers.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TeacherCardDropDownSearchItem(
                              teacherImge: teachers[index].photo,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  TeacherSubjectsView.id,
                                  arguments: teachers[index],
                                );
                              },
                              teacherName: teachers[index].name,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
