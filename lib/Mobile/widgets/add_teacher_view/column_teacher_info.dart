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
    required this.controller,
    this.validator,
    this.keyboardType, this.canRead=false,
  });
  final double horizntalSize;
  final String labelText;
  final String hintText;
  final IconData iconData;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? canRead;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          InfoTextField(
            canRead: canRead,
            keyboardType: keyboardType,
            validator: validator,
            hintText: hintText,
            iconData: iconData,
            controller: controller,
          )
        ],
      ),
    );
  }
}
