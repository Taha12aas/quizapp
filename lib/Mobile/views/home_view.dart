import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/home_view/custom_drawer.dart';
import 'package:quizapp/Mobile/widgets/home_view/main_sections.dart';
import 'package:quizapp/Mobile/widgets/home_view/teacher_card.dart';
import 'package:quizapp/main_view_app_bar.dart';
import 'package:quizapp/font_style.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainViewAppBar(context),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const MainSections(),
            const SizedBox(height: 20),
            const Text(' :  أحدث النشاطات',
                style: FontStyleApp.textStyleOrangeBold25),
            const SizedBox(height: 10),
            TeacherCard(
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
