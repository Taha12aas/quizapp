import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/column_teacher_info.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/column_subject_check.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/container_teache_subjects_display.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/horizontal_divider.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/info_text_field.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/custom_app_bar.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class AddTeacherView extends StatefulWidget {
  const AddTeacherView({super.key});

  static String id = 'AddTeacher';

  @override
  State<AddTeacherView> createState() => _AddTeacherViewState();
}

class _AddTeacherViewState extends State<AddTeacherView> {
  TextEditingController teacherName = TextEditingController();
  TextEditingController teacherPhone = TextEditingController();
  TextEditingController teacherAddress = TextEditingController();
  bool enable = false;
  bool selected = false;
  String selectedClass = 'بكلوريا';
  String selectedSubject = '';
  List<String> classes = [];
  List<String> subjects = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('إضافة مدرس'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ': الاسم',
                    textAlign: TextAlign.end,
                    style: FontStyleApp.white18
                        .copyWith(fontSize: getResponsiveText(context, 18)),
                  ),
                ],
              ),
              const HorizontalDivider(
                size: 50,
              ),
              const SizedBox(
                height: 18,
              ),
              InfoTextField(
                controller: TextEditingController(),
                hintText: 'أسم المدرس',
                iconData: FontAwesomeIcons.userPlus,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: ColumnTeacherInfo(
                      controller: TextEditingController(),
                      labelText: ': العنوان',
                      hintText: 'ادخل عنوان',
                      iconData: FontAwesomeIcons.locationDot,
                      horizntalSize: 64,
                    ),
                  ),
                  Expanded(
                    child: ColumnTeacherInfo(
                      controller: TextEditingController(),
                      labelText: ': رقم الهاتف',
                      hintText: 'ادخل رقم',
                      iconData: FontAwesomeIcons.phone,
                      horizntalSize: 89,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ColumnSubjectCheck(
                    onChanged: (p0) {
                      selectedSubject = p0!;
                    },
                    enabled: enable,
                    selectedValue: kSchoolSubjects[selectedClass]![0],
                    horizntalSize: 52,
                    itemsSubject: kSchoolSubjects[selectedClass]!,

title: ': المادة',
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.022,
                  ),
                  ColumnSubjectCheck(
                    onChanged: (p0) {
                      setState(() {
                        enable = true;
                        selectedClass = p0!;
                        selected = true;
                      });
                    },
                    enabled: true,
                    horizntalSize: 55,
                    selectedValue: selectedClass,
                    itemsSubject: kSchoolSubjects.keys.toList(),
                    title: ': الصف',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  title: 'إضافة مادة',
                  onPressed: () {
                    setState(() {
                      if (selected && selectedSubject != '') {
                        classes.add(selectedClass);
                        subjects.add(selectedSubject);
                      }
                    });
                  }),
              const SizedBox(
                height: 35,
              ),
              ContainerTeacherSubjectsDisplay(
                height: MediaQuery.of(context).size.height * 0.24,
                nameTeacher: '',
                classes: classes,
                subjects: subjects,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.021,
              ),
              CustomButton(
                onPressed: () {},
                title: 'حفظ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}