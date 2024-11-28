
import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/font_style.dart';
import 'package:quizapp/responsive_text.dart';

class CardSubjects extends StatelessWidget {
  const CardSubjects({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHeight * 0.12,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: kAshenColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/Teachers.png',
              // عرض الصورة
              height: screenHeight * 0.074, // ارتفاع الصورة
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: screenWidth * 0.2,
          ),
          Text(
            'طه حوراني',
            style: FontStyleApp.textStyleOrange15
                .copyWith(fontSize: getResponsiveText(context, 15)),
          ),
          Text(': اسم المدرس',
              style: FontStyleApp.textStyleOrange15
                  .copyWith(fontSize: getResponsiveText(context, 15))),
          const SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }
}
