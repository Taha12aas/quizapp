import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/column_add_teacher.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/horizontal_divider.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/info_text_field.dart';
import 'package:quizapp/utils/custom_app_bar.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class AddTeacher extends StatelessWidget {
  const AddTeacher({super.key});
  static const List<String> itemsClass = [
    'صف أول',
    'صف ثاني',
    'صف ثالث',
    'صف رابع',
    'صف خامس',
    'صف سادس'
  ];
  static const List<String> itemsObject = [
    'علوم',
    'رياضيات',
    'انكليزي',
    'عربي',
    'فرنسي',
    'تاريخ',
    'جغرافيا'
  ];
  static String id = 'AddTeacher';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('إضافة مدرس'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'data',
                style: TextStyle(fontSize: 100),
              ),
              const SizedBox(
                height: 54,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ': الاسم',
                    textAlign: TextAlign.end,
                    style: FontStyleApp.labels
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
              const InfoTextField(
                hintText: 'طه الفاخوري',
                iconData: FontAwesomeIcons.userPlus,
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
                children: [
                  ColumnAddTeacher(
                    labelText: ': العنوان',
                    hintText: 'جنوب الملعب',
                    iconData: FontAwesomeIcons.locationDot,
                    horizntalSize: 64,
                  ),
                  ColumnAddTeacher(
                    labelText: ': رقم الهاتف',
                    hintText: '0962449054',
                    iconData: FontAwesomeIcons.phone,
                    horizntalSize: 89,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
