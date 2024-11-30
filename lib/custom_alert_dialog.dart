import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/alert_dialog_text_field.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/font_style.dart';
import 'package:quizapp/responsive_text.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 68,vertical: 15),
      actions: [
        Center(
          child: SizedBox(
            width: 150,
            child: CustomButton(
              onPressed: onPressed,
              label: 'موافق',
              iconData: Icons.check,
            ),
          ),
        )
      ],
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: kOrangeColor, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: kAshenColor,
      title: Text('أدخل رمز التحقق',
          textAlign: TextAlign.center,
          style: FontStyleApp.snakBarLabel
              .copyWith(fontSize: getResponsiveText(context, 18))),
      content: const AlertDialogTextField(),
    );
  }
}
