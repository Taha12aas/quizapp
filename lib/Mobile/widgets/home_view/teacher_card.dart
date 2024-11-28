import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/font_style.dart';
import 'package:quizapp/responsive_text.dart';

class TeacherCard extends StatelessWidget {
  const TeacherCard({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: screenHeight * 0.12,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kAshenColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/TeachersTaha.jpg',
              // عرض الصورة
              height: screenHeight * 0.074, // ارتفاع الصورة
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'طه حوراني',
                      style: FontStyleApp.textStyleOrange15
                          .copyWith(fontSize: getResponsiveText(context, 15)),
                      // نص برتقالي
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      ': اسم المدرس',
                      style: FontStyleApp.textStylewite15
                          .copyWith(fontSize: getResponsiveText(context, 15)),
                      // نص أبيض
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'رياضيات',
                      style: FontStyleApp.textStyleOrange15
                          .copyWith(fontSize: getResponsiveText(context, 15)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      ': اسم المادة',
                      style: FontStyleApp.textStylewite15
                          .copyWith(fontSize: getResponsiveText(context, 15)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
