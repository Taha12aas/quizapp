import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/font_style.dart';
import 'package:quizapp/responsive_text.dart';

class CardSubjects extends StatelessWidget {
  const CardSubjects({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kAshenColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: screenWidth * 0.02),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/Teachers.png',
                height: screenHeight * 0.074,
                width: screenHeight * 0.074,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'علوم',
                    style: FontStyleApp.textStyleOrange15.copyWith(
                      fontSize: getResponsiveText(context, 15),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Text(
                    ' : اسم المادة',
                    style: FontStyleApp.textStylewite15.copyWith(
                      fontSize: getResponsiveText(context, 15),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: screenWidth * 0.03),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
          ],
        ),
      ),
    );
  }
}
