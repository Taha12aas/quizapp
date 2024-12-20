import 'package:flutter/material.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';

AppBar customAppBar(String title) {
  return AppBar(
    centerTitle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
    ),
    backgroundColor: kAshenColor,
    title: Text(
      title,
      style: FontStyleApp.textStylewite15.copyWith(fontWeight: FontWeight.w800),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
