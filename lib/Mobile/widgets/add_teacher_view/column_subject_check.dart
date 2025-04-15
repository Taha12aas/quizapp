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
    required this.enabled,
    this.onChanged,
    this.selectedValue,
  });

  final String title;
  final List<String> itemsSubject;
  final double horizntalSize;
  final bool enabled;
  final void Function(String?)? onChanged;
  final String? selectedValue;

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
            style: FontStyleApp.white18
                .copyWith(fontSize: getResponsiveText(context, 18)),
          ),
          HorizontalDivider(
            size: horizntalSize,
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.44,
            child: DropdownCheckSubject(
              onChanged: onChanged,
              enabled: enabled,
              items: itemsSubject,
              selectedValue: selectedValue,
            ),
          ),
        ],
      ),
    );
  }
}
