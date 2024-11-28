import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/teacher_subjects.dart';
import 'package:quizapp/Mobile/views/teachers_view.dart';
import 'package:quizapp/Mobile/widgets/home_view/main_categories_section.dart';

class MainSections extends StatelessWidget {
  const MainSections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MainCategoriesSection(
                  onTap: () {
                    Navigator.pushNamed(context, TeachersView.id);
                  },
                  image: 'assets/images/subjects.png',
                  label: 'المدرسين',
                ),
                MainCategoriesSection(
                  image: 'assets/images/Teachers.png',
                  label: 'المواد',
                  onTap: () {
                    Navigator.pushNamed(context, TeacherSubjects.id);
                  },
                ),
      ],
    );
  }
}
