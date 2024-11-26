import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/font_style.dart';

AppBar customAppBar(String title) {
  return AppBar(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28)),
    ),
    backgroundColor: kAshenColor,
    title:  Center(
      child: Text(title,style:FontStyleApp.textStylewite15 ,)
    ),
  );
}
