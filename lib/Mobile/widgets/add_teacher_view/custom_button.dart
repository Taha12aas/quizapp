import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.057,
        decoration: BoxDecoration(
          color: kOrange,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(
            title,
            style: FontStyleApp.wite15
                .copyWith(fontSize: getResponsiveText(context, 20)),
          ),
        ),
      ),
    );
  }
}
