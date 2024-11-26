
import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/home_view/main_categories_section.dart';

class MainSections extends StatelessWidget {
  const MainSections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MainCategoriesSection(
          image: 'assets/images/subjects.png',
          label: 'المدرسين',
        ),
        MainCategoriesSection(
          image: 'assets/images/Teachers.png',
          label: 'المواد',
        ),
      ],
    );
  }
}
