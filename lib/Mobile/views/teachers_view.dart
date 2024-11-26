import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/home_view/teacher_card.dart';
import 'package:quizapp/Tablet/widgets/buttomclass.dart';
import 'package:quizapp/custom_app_bar.dart';
import 'package:quizapp/font_style.dart';

class TeachersView extends StatelessWidget {
  const TeachersView({super.key});
  static String id = 'TeachersView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 8, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              ' : تصنيف حسب الصفوف ',
              style: FontStyleApp.textStyleOrangeBold25,
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return ButtomClass(
                    text: 'صف الاول',
                    onTap: () {},
                  );
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const TeacherCard()
          ],
        ),
      ),
    );
  }
}
