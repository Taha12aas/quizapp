
import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/card_subjects.dart';

class ListViewCardSubjects extends StatelessWidget {
  const ListViewCardSubjects({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CardSubjects(
            onTap: () {},
          ),
        );
      },
    );
  }
}
