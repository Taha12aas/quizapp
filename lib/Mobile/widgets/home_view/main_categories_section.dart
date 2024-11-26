import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/responsive_text.dart';
//Container الموجود في الصفحة الرئيسة
class MainCategoriesSection extends StatelessWidget {
  const MainCategoriesSection(
      {super.key, required this.label, required this.image});

  final String label;
  final String image;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.40,
      decoration: BoxDecoration(
        color: kAshenColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(image, height: screenHeight * 0.08),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                color: kOrangeColor,
                fontSize: getResponsiveText(context, 30),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
