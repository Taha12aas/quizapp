import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/drop_down_check_subject.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/horizontal_divider.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class ColumnSubjectCheck extends StatelessWidget {
  const ColumnSubjectCheck({
    super.key,
    required this.itemsSubject,
    required this.title,
    required this.horizntalSize,
  });
  final String title;
  final List<String> itemsSubject;
  final double horizntalSize;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            textAlign: TextAlign.end,
            style: FontStyleApp.labels
                .copyWith(fontSize: getResponsiveText(context, 18)),
          ),
          HorizontalDivider(
            size: horizntalSize,
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.44,
              child: DropdownCheckSubject(
                items: itemsSubject,
              ))
        ],
      ),
    );
  }
}
