import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizapp/Mobile/views/add_subject_in_teacher_view.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/column_teacher_info.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/container_teache_subjects_display.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:quizapp/Mobile/widgets/teather_profile_view%20copy/teacher_photor.dart';
import 'package:quizapp/models/teacher_model.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/custom_app_bar.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class TeacherProfileView extends StatefulWidget {
  const TeacherProfileView({super.key});
  static String id = 'TeacherProfile';

  @override
  State<TeacherProfileView> createState() => _TeacherProfileViewState();
}

class _TeacherProfileViewState extends State<TeacherProfileView> {
  late TeacherModel teacherModel;
  File? selectedImage;

  @override
  void didChangeDependencies() {
    teacherModel = ModalRoute.of(context)!.settings.arguments as TeacherModel;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(teacherModel.name),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                TeacherPhoto(
                  selectedImage: selectedImage,
                  onPressed: _pickImage,
                  image: teacherModel.photo,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 175,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      style: FontStyleApp.white18.copyWith(
                        fontSize: getResponsiveText(context, 18),
                      ),
                      initialValue: teacherModel.name,
                      textDirection: TextDirection.rtl,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 1),
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kOrange),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    ': الاسم',
                    style: FontStyleApp.orange18
                        .copyWith(fontSize: getResponsiveText(context, 18)),
                  )
                ]),
                const SizedBox(height: 15),
                Row(
                  children: [
                    ColumnTeacherInfo(
                      labelText: ': العنوان',
                      hintText: teacherModel.address,
                      iconData: FontAwesomeIcons.locationDot,
                      horizntalSize: 64,
                    ),
                    ColumnTeacherInfo(
                      labelText: ': رقم الهاتف',
                      hintText: teacherModel.phone.toString(),
                      iconData: FontAwesomeIcons.phone,
                      horizntalSize: 89,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(
                  title: 'تغير كلمة المرور',
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                CustomButton(
                  title: 'إضافة مادة',
                  onPressed: () {
                    Navigator.pushNamed(context, AddSubjectInTeacherView.id,arguments: teacherModel);
                  },
                ),
                const SizedBox(height: 20),
                ContainerTeacherSubjectsDisplay(
                  classes: teacherModel.classesSubjects['صف'],
                  subjects: teacherModel.classesSubjects['مواد'],
                ),
                const SizedBox(height: 30),
                CustomButton(
                  title: 'حفظ',
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }
}
