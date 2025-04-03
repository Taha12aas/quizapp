import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/button_class.dart';

class ListViewButtonClass extends StatelessWidget {
  const ListViewButtonClass({
    super.key,
    required this.classes, required this.onTap,
  });
  final List<String> classes;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        reverse: true,
        padding: const EdgeInsets.only(top: 10),
        scrollDirection: Axis.horizontal,
        itemCount: classes.length,
        itemBuilder: (context, index) {
          return ButtonClass(
            text: classes[index],
            onTap: onTap,
          );
        },
      ),
    );
  }
}
