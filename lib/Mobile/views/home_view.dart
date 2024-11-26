import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/home_screen/build_teacher_card.dart';
import 'package:quizapp/Mobile/widgets/home_screen/custom_drawer.dart';
import 'package:quizapp/Mobile/widgets/home_screen/main_categories_section.dart';
import 'package:quizapp/custom_app_bar.dart';
import 'package:quizapp/font_style.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      drawer: const CustomDrawer(),
      backgroundColor: const Color(0xFF191E2C),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainCategoriesSection(
                  image: 'assets/images/subjects.png',
                  label: 'المدرسين',
                ),
                MainCategoriesSection(
                  image: 'assets/images/Teachers.png',
                  label: 'المواد',
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(' :  أحدث النشاطات',
                style: FontStyleApp.textStyleOrangeBold25),
            SizedBox(height: 10),
            TeacherCard()
          ],
        ),
      ),
    );
  }
}
