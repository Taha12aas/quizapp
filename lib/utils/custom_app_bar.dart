import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/auth_text_field.dart';
import 'package:quizapp/Mobile/widgets/teachers_view_and_subjects_view/list_view_card_subjects.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';

AppBar customAppBar(
    String title, bool isfoundsearchicon, BuildContext context) {
  return AppBar(
    centerTitle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
    ),
    backgroundColor: kAshenColor,
    title: Text(
      title,
      style: FontStyleApp.textStylewite15,
    ),
    actions: [
      isfoundsearchicon
          ? Padding(
              padding: const EdgeInsets.only(
                right: 12,
              ),
              child: IconButton(
                onPressed: () {
                  showCustomDropDownSearch(context);
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            )
          : const SizedBox()
    ],
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}

void showCustomDropDownSearch(BuildContext context) {
  showModalBottomSheet(
    scrollControlDisabledMaxHeightRatio: 900,
    backgroundColor: kBackGround,
    context: context,
    shape: const RoundedRectangleBorder(
      side: BorderSide(color: kOrangeColor),
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
                style: FontStyleApp.textStyleOrange18,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: AuthTextField(hintText: 'ابحث', iconData: Icons.search),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView(
              shrinkWrap: true,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                  child: SizedBox(
                    height: 400,
                    child:
                        ListViewCardSubjects(), //استبدالها في وحدة جديدة بقلها اسم المدرس و صورته فقط
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ],
        ),
      );
    },
  );
}

//خود هاد التابع وحطو بدال showCustomDropDownSearch وشوف شكلو
// void showDropDownSearch(BuildContext context) {
//   DropDownState(
//     heightOfBottomSheet: 800,
//     DropDown(
//       searchHintText: 'ابحث',
//       data: [
//         SelectedListItem(name: "طه حوراني", value: "1"),
//         SelectedListItem(name: "سليم عويجان", value: "2"),
//         SelectedListItem(name: "طه فاخوري", value: "3"),
//         SelectedListItem(name: "علوم", value: "4"),
//       ],
//       bottomSheetTitle: const Directionality(
//         textDirection: TextDirection.rtl, // ضبط العنوان ليظهر من اليمين
//         child: Text(
//           'ابحث عن المدرس',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ),
//       enableMultipleSelection: false, // السماح باختيار عنصر واحد فقط
//       selectedItems: (List<dynamic> selectedList) {
//         // يتم تنفيذ هذه الدالة عند اختيار عنصر
//         if (selectedList.isNotEmpty) {
//           final selected = selectedList.first as SelectedListItem;
//           print("تم اختيار المدرس: ${selected.name}");
//         }
//       },
//     ),
//   ).showModal(context); // عرض القائمة المنسدلة
// }
