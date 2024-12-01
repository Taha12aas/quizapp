import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/text_filed_icon.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/statue_border.dart';
import 'package:quizapp/utils/constants.dart';

class InfoTextField extends StatelessWidget {
  const InfoTextField({
    super.key,
    required this.hintText,
    required this.iconData,
  });
  final String hintText;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 1),
        hintTextDirection: TextDirection.rtl,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: TextFieldIconS(iconData: iconData),
        enabledBorder: statueBorder(Colors.white),
        disabledBorder: statueBorder(Colors.white),
        focusedBorder: statueBorder(kOrangeColor),
      ),
    );
  }
}
