import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: kOrangeBlack,
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5.0,
            offset: const Offset(3, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: kOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            minimumSize: Size(
              double.infinity,
              clampDouble(MediaQuery.of(context).size.height * 0.05, 40, 60),
            ),
          ),
          child: FittedBox(
            child: Text(
              title,
              style: FontStyleApp.white15.copyWith(
                fontSize: getResponsiveText(context, 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
