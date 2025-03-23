import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/statue_border.dart';
import 'package:quizapp/utils/constants.dart';

class AlertDialogTextField extends StatelessWidget {
  const AlertDialogTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
      child: TextField(
        decoration: InputDecoration(
          hintText: '####',
          fillColor: Colors.white,
          filled: true,
          enabledBorder: statueBorder(Colors.white),
          disabledBorder: statueBorder(Colors.white),
          focusedBorder: statueBorder(kOrange),
        ),
      ),
    );
  }
}
