import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/Cubits/cubitTeacher/cubit_teacher.dart';
import 'package:quizapp/Mobile/views/home_view.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/column_teacher_info.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/auth_text_field.dart';
import 'package:quizapp/Mobile/widgets/home_view/DropDownSearch/teacher_card_drop_down_search_item.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';

void showCustomDropDownDelete(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: kBackGround,
    context: context,
    shape: const RoundedRectangleBorder(
      side: BorderSide(color: kOrange),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: _SearchTeacherSheet(),
      );
    },
  );
}

class _SearchTeacherSheet extends StatefulWidget {
  @override
  State<_SearchTeacherSheet> createState() => _SearchTeacherSheetState();
}

class _SearchTeacherSheetState extends State<_SearchTeacherSheet> {
  TextEditingController searchController = TextEditingController();
  List filteredTeachers = [];

  @override
  void initState() {
    super.initState();
    filteredTeachers = List.from(CubitTeacher.teachers);
    searchController.addListener(_filterTeachers);
  }

  void _filterTeachers() {
    final query = searchController.text.trim().toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredTeachers = List.from(CubitTeacher.teachers);
      } else {
        filteredTeachers = CubitTeacher.teachers.where((teacher) {
          final name = teacher.name.toLowerCase();
          return name.contains(query);
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    searchController.removeListener(_filterTeachers);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15, right: 15),
          child: Text(
            'ابحث عن المدرس',
            style: FontStyleApp.orange18,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ColumnTeacherInfo(
            horizntalSize: 0,
            labelText: '',
            controller: searchController,
            hintText: 'ابحث',
            iconData: Icons.search,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredTeachers.length,
              itemBuilder: (context, index) {
                final teacher = filteredTeachers[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TeacherCardDropDownSearchItem(
                    teacherImge: teacher.photo,
                    teacherName: teacher.name,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialogButton(
                            teacherName: teacher.name,
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CustomAlertDialogButton extends StatelessWidget {
  const CustomAlertDialogButton({
    super.key,
    required this.teacherName,
  });
  final String teacherName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Directionality(
          textDirection: TextDirection.rtl,
          child: Text('هل انت متأكد من الحذف ؟')),
      content: Directionality(
          textDirection: TextDirection.rtl, child: Text(teacherName)),
      actions: [
        Row(
          children: [
            Expanded(
              child: CustomButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                label: 'الغاء',
                iconData: Icons.close,
              ),
            ),
            Expanded(
              child: CustomButton(
                onPressed: () {
                  context.read<CubitTeacher>().deleteUsers(teacherName);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    HomeView.id,
                    (route) => false,
                  );
                },
                label: 'حذف',
                iconData: Icons.delete,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
