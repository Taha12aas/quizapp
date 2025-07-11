import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/column_teacher_info.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/horizontal_divider.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/info_text_field.dart';
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
  String selectedClass = 'اول';
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
              
                  ColumnTeacherInfo(
                    controller: TextEditingController(),
                    labelText: ': العنوان',
                    hintText: 'ادخل عنوان',
                    iconData: FontAwesomeIcons.locationDot,
                    horizntalSize: 64,
                  ),
                  ColumnTeacherInfo(
                    controller: TextEditingController(),
                    labelText: ': رقم الهاتف',
                    hintText: 'ادخل رقم',
                    iconData: FontAwesomeIcons.phone,
                    horizntalSize: 89,
                  ),
                
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
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
