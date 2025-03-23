import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/horizontal_divider.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/info_text_field.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class ColumnTeacherInfo extends StatelessWidget {
  const ColumnTeacherInfo({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.iconData,
    required this.horizntalSize,
  });
  final double horizntalSize;
  final String labelText;
  final String hintText;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              labelText,
              textAlign: TextAlign.end,
              style: FontStyleApp.whiteBold18
                  .copyWith(fontSize: getResponsiveText(context, 18)),
            ),
            HorizontalDivider(
              size: horizntalSize,
            ),
            const SizedBox(
              height: 5,
            ),
            InfoTextField(hintText: hintText, iconData: iconData)
          ],
        ),
      ),
    );
  }
}
