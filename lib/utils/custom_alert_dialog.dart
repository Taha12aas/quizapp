
import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/home_view.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kAshen,
      actions: [
        Center(
          child: Text(
            'هل تريد عمل تحديث للبيانات ؟',
            style: FontStyleApp.orange25.copyWith(
              fontSize: getResponsiveText(context, 24),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'الغاء',
                style: FontStyleApp.orange25.copyWith(
                  fontSize: getResponsiveText(context, 18),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomeView.id,
                  (route) => false,
                );
              },
              child: Text(
                'موافق',
                style: FontStyleApp.orange25.copyWith(
                  fontSize: getResponsiveText(context, 18),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
