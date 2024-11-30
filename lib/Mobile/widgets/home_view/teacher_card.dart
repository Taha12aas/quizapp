import 'package:flutter/material.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class TeacherCard extends StatelessWidget {
  const TeacherCard({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
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
                height: screenHeight * 0.074,
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
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        ': اسم المدرس',
                        style: FontStyleApp.textStylewite15
                            .copyWith(fontSize: getResponsiveText(context, 15)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
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
      ),
    );
  }
}
