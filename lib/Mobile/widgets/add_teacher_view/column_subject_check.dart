
import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/drop_down_check_subject.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/horizontal_divider.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';


class ColumnSubjectCheck extends StatelessWidget {
  const ColumnSubjectCheck({
    super.key,
    required this.itemsSubject, required this.title, required this.hint,
  });
  final String title;
  final String hint;
  final List<String> itemsSubject;

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
        HorizontalDivider(size: getResponsiveText(context, 50)),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            width:MediaQuery.of(context).size.width*0.40,
            child:  DropdownCheckSubject(
              hint:hint,
              items: itemsSubject,
            ))
      ],
    );
  }
}
