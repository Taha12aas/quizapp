import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/teacher_subjects_view.dart';
import 'package:quizapp/Mobile/widgets/home_view/custom_drawer.dart';
import 'package:quizapp/Mobile/widgets/home_view/main_sections.dart';
import 'package:quizapp/Mobile/widgets/home_view/teacher_card.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/main_view_app_bar.dart';
import 'package:quizapp/utils/responsive_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('الصفحة الرئيسية', context),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const MainSections(),
            const SizedBox(height: 20),
            Container(
              width: 158,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.trending_up, color: kOrange),
                    const SizedBox(width: 8),
                    Text(
                      "أحدث النشاطات",
                      style: TextStyle(
                        fontSize: getResponsiveText(context, 18),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            TeacherCard(
              subject: 'رياضيات',
              teacherName: 'طه حوراني',
              onTap: () {
                Navigator.pushNamed(context, TeacherSubjects.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
