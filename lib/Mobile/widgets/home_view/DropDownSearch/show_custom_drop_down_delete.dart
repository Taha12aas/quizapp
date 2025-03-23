import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/auth_text_field.dart';
import 'package:quizapp/Mobile/widgets/home_view/DropDownSearch/teacher_card_drop_down_search_item.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';

void showCustomDropDownDelete(BuildContext context) {
  showModalBottomSheet(
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
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TeacherCardDropDownSearchItem(
                        teacherImge: 'assets/images/deleteuser.png',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CustomAlertDialogButton();
                            },
                          );
                        },
                        teacherName: 'طه حوراني',
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

class CustomAlertDialogButton extends StatelessWidget {
  const CustomAlertDialogButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Directionality(
          textDirection: TextDirection.rtl, child: Text('تنبيه')),
      content: const Directionality(
          textDirection: TextDirection.rtl,
          child: Text('هل تريد حذف طه حوراني؟')),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('إلغاء', style: TextStyle(color: kOrange)),
            ),
            CustomButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              label: 'حذف',
              iconData: Icons.check,
            ),
          ],
        ),
      ],
    );
  }
}
