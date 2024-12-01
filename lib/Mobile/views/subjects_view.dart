import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/list_view_buttin_class.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/list_view_card_subjects.dart';
import 'package:quizapp/utils/custom_app_bar.dart';
import 'package:quizapp/utils/font_style.dart';

class SubjectsView extends StatelessWidget {
  const SubjectsView({super.key});
  static String id = 'SubjectsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('المواد'),
      body: const Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              ' : تصنيف حسب الصفوف ',
              style: FontStyleApp.textStyleOrangeBold25,
            ),
            ListViewButtonClass(),
            SizedBox(
              height: 20,
            ),
            Expanded(child: ListViewCardSubjects())
          ],
        ),
      ),
    );
  }
}
