import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/font_style.dart';

AppBar customAppBar(String title,bool isfoundsearchicon) {
  return AppBar(centerTitle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28)),
    ),
    backgroundColor: kAshenColor,
    title:  Text(title,style:FontStyleApp.textStylewite15 ,),
    actions:  [isfoundsearchicon?
      const Padding(
        padding: EdgeInsets.only(right: 8),
        child: Icon(Icons.search,color: Colors.white,),
      ):const SizedBox()
    ],
  );
}
