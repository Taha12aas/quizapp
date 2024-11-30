
import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/auth_text_field.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/font_style.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key, required this.onPressed,
  });
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        CustomButton(
          onPressed:onPressed,
          label: 'موافق',
          iconData: Icons.check,
        )
      ],
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: kOrangeColor, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: kAshenColor,
      title: const Text(
        'أدخل رمز التحقق',
        textAlign: TextAlign.center,
        style: FontStyleApp.snakBarLabel,
      ),
      content: const AuthTextField(
        hintText: '####',
        iconData: Icons.format_list_numbered_sharp,
      ),
    );
  }
}
