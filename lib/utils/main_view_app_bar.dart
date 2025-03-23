import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/home_view/DropDownSearch/show_custom_drop_down_search.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

AppBar mainAppBar(String title, BuildContext context) {
  return AppBar(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
    ),
    backgroundColor: kAshen,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Center(
            child: Text(
              title,
              style: FontStyleApp.white15.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: getResponsiveText(context, 18),
              ),
            ),
          ),
        ),
        IconButton(
          tooltip: 'search',
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {
            showCustomDropDownSearch(context);
          },
        ),
      ],
    ),
  );
}
