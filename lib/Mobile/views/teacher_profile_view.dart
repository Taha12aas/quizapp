import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizapp/Cubits/cubitTeacher/cubit_teacher.dart';
import 'package:quizapp/Cubits/cubitTeacher/ques_app_status.dart';
import 'package:quizapp/Mobile/views/add_subject_in_teacher_view.dart';
import 'package:quizapp/Mobile/views/home_view.dart';
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

  TextEditingController nameTeacherController = TextEditingController();
  TextEditingController phoneTeacherController = TextEditingController();
  TextEditingController addressTeacherController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  void didChangeDependencies() {
    teacherModel = ModalRoute.of(context)!.settings.arguments as TeacherModel;
    nameTeacherController.text = teacherModel.name;
    phoneTeacherController.text = teacherModel.phone.toString();
    addressTeacherController.text = teacherModel.address;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    nameTeacherController.dispose();
    phoneTeacherController.dispose();
    addressTeacherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitTeacher, TeacherStatuses>(
      builder: (context, state) {
        if (state is SuccessStateTeacher) {
          return Form(
            key: globalKey,
            child: Scaffold(
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 175,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value == '') {
                                      return 'الاسم مطلوب';
                                    }
                                    return null;
                                  },
                                  controller: nameTeacherController,
                                  textAlign: TextAlign.center,
                                  style: FontStyleApp.white18.copyWith(
                                    fontSize: getResponsiveText(context, 18),
                                  ),
                                  textDirection: TextDirection.rtl,
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 1),
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
                                style: FontStyleApp.orange18.copyWith(
                                    fontSize: getResponsiveText(context, 18)),
                              )
                            ]),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            ColumnTeacherInfo(
                              validator: (p0) {
                                if (p0 == null || p0 == '') {
                                  return 'العنوان مطلوب';
                                }
                                return null;
                              },
                              controller: addressTeacherController,
                              labelText: ': العنوان',
                              hintText: addressTeacherController.text,
                              iconData: FontAwesomeIcons.locationDot,
                              horizntalSize: 64,
                            ),
                            ColumnTeacherInfo(
                              keyboardType: TextInputType.phone,
                              validator: (p0) {
                                if (p0 == null || p0 == '' || p0.length != 12) {
                                  return 'ادخال خاطئ';
                                }
                                return null;
                              },
                              controller: phoneTeacherController,
                              labelText: ': رقم الهاتف',
                              hintText: phoneTeacherController.text,
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
                            Navigator.pushNamed(
                                context, AddSubjectInTeacherView.id,
                                arguments: teacherModel);
                          },
                        ),
                        const SizedBox(height: 20),
                        ContainerTeacherSubjectsDisplay(
                          nameTeacher: teacherModel.name,
                          classes: teacherModel.classesSubjects['صف'],
                          subjects: teacherModel.classesSubjects['مواد'],
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          title: 'حفظ',
                          onPressed: () {
                            if (globalKey.currentState!.validate()) {
                              context.read<CubitTeacher>().updateMultiColumns({
                                'name': nameTeacherController.text,
                                'phone': phoneTeacherController.text,
                                'address': addressTeacherController.text
                              }, teacherModel.name);
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                HomeView.id,
                                (route) => false,
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (state is LoadingStateTeacher) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text(
                'حدث خطا ما',
                style: FontStyleApp.blackBold16,
              ),
            ),
          );
        }
      },
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
