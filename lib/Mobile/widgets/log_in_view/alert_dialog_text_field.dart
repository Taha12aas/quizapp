
import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/statue_border.dart';
import 'package:quizapp/constants.dart';

class AlertDialogTextField extends StatelessWidget {
  const AlertDialogTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: '####',
        fillColor: Colors.white,
        filled: true,
        enabledBorder: statueBorder(Colors.white),
        disabledBorder: statueBorder(Colors.white),
        focusedBorder: statueBorder(kOrangeColor),
      ),
    );
  }
}
