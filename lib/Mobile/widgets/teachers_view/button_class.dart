import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/font_style.dart';

class ButtonClass extends StatelessWidget {
  const ButtonClass({
    super.key,
    this.onTap,
    required this.text,
  });
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
      ),
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: kOrangeColor,
              borderRadius: BorderRadius.circular(12)),
          width: 82,
          child: Center(
              child: Text(
            text,
            style: FontStyleApp.textStyleOrange15,
          )),
        ),
      ),
    );
  }
}
