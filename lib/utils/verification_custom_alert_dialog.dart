import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/alert_dialog_text_field.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class VerificationCustomAlertDialog extends StatelessWidget {
  const VerificationCustomAlertDialog({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 73, vertical: 15),
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
        side: const BorderSide(color: kOrange, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: kAshen,
      title: Text('أدخل رمز التحقق',
          textAlign: TextAlign.center,
          style: FontStyleApp.white18
              .copyWith(fontSize: getResponsiveText(context, 18))),
      content: const AlertDialogTextField(),
    );
  }
}
