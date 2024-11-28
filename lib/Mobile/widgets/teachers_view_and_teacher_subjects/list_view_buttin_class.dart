import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_teacher_subjects/button_class.dart';

class ListViewButtonClass extends StatelessWidget {
  const ListViewButtonClass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) {
          return ButtonClass(
            text: 'صف اول',
            onTap: () {},
          );
        },
      ),
    );
  }
}
