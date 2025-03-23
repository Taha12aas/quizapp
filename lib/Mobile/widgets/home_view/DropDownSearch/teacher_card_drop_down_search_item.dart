import 'package:flutter/material.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class TeacherCardDropDownSearchItem extends StatelessWidget {
  const TeacherCardDropDownSearchItem({
    super.key,
    required this.onTap,
    required this.teacherName,
    required this.teacherImge,
  });
  final void Function()? onTap;

  final String teacherName;
  final String teacherImge;

  @override
  Widget build(BuildContext context) {
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
          color: kAshen,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  child: Text(
                    ' اسم المدرس  :  ',
                    style: FontStyleApp.wite15
                        .copyWith(fontSize: getResponsiveText(context, 15)),
                  ),
                ),
                FittedBox(
                  child: Text(
                    teacherName,
                    style: FontStyleApp.orange15
                        .copyWith(fontSize: getResponsiveText(context, 15)),
                  ),
                ),
              ],
            ),
            FittedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  teacherImge,
                  height: screenHeight * 0.074,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
