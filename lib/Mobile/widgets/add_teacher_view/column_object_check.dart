
import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/drop_down_check_object.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';


class ColumnObjectCheck extends StatelessWidget {
  const ColumnObjectCheck({
    super.key,
    required this.itemsObject, required this.title, required this.hint,
  });
  final String title;
  final String hint;
  final List<String> itemsObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          textAlign: TextAlign.end,
          style: FontStyleApp.labels
              .copyWith(fontSize: getResponsiveText(context, 18)),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            width:MediaQuery.of(context).size.width*0.40,
            child:  DropdownCheckObject(
              hint:hint,
              items: itemsObject,
            ))
      ],
    );
  }
}
