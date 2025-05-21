import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/statue_border.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/text_field_icons.dart';
import 'package:quizapp/utils/constants.dart';

class InfoTextField extends StatelessWidget {
  const InfoTextField({
    super.key,
    required this.hintText,
    required this.iconData,
    required this.controller,
    this.validator,
    this.keyboardType,
  });
  final String hintText;
  final IconData iconData;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 1),
        hintTextDirection: TextDirection.rtl,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: TextFieldIcons(iconData: iconData),
        enabledBorder: statueBorder(Colors.white),
        disabledBorder: statueBorder(Colors.white),
        focusedBorder: statueBorder(kOrange),
      ),
    );
  }
}
