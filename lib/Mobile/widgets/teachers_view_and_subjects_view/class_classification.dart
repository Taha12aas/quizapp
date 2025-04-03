import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

//Container الموجود في الصفحة الرئيسة
class ClassClassification extends StatelessWidget {
  const ClassClassification(
      {super.key, required this.label, required this.onTap});

  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Bounceable(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.5,
        decoration: BoxDecoration(
          color: kAshen,
          border: Border.all(
            color: kOrangeBlack,
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 5.0,
              offset: const Offset(3, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              label,
              style: FontStyleApp.orange18.copyWith(
                fontSize: getResponsiveText(context, 23),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
