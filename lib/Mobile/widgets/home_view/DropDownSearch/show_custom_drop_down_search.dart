import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/generated_questions_view.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/auth_text_field.dart';
import 'package:quizapp/Mobile/widgets/home_view/DropDownSearch/teacher_card_drop_down_search_item.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';

void showCustomDropDownSearch(BuildContext context) {
  showModalBottomSheet(
    scrollControlDisabledMaxHeightRatio: 900,
    backgroundColor: kBackGround,
    context: context,
    shape: const RoundedRectangleBorder(
      side: BorderSide(color: kOrange),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'ابحث عن المدرس',
                style: FontStyleApp.orange18,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: AuthTextField(hintText: 'ابحث', iconData: Icons.search),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              child: SizedBox(
                height: 500,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TeacherCardDropDownSearchItem(
                          teacherImge: 'assets/images/TeachersTaha.jpg',
                          onTap: () {
                            Navigator.pushNamed(
                                context, GeneratedQuestionsView.id);
                          },
                          teacherName: 'طه حوراني',
                        ),
                      ),
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
