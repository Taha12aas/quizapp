import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:quizapp/Cubits/cubitTeacher/cubit_teacher.dart';
import 'package:quizapp/Cubits/cubitTeacher/ques_app_status.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/column_teacher_info.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/horizontal_divider.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/info_text_field.dart';
import 'package:quizapp/models/teacher_model.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/custom_app_bar.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';
import 'package:quizapp/utils/show_snack_bar.dart';

class AddTeacherView extends StatefulWidget {
  const AddTeacherView({super.key});

  static String id = 'AddTeacher';

  @override
  State<AddTeacherView> createState() => _AddTeacherViewState();
}

class _AddTeacherViewState extends State<AddTeacherView> {
  TextEditingController teacherName = TextEditingController();
  TextEditingController teacherPhone = TextEditingController();
  TextEditingController teacherAddress = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  bool printingPermission = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Scaffold(
        appBar: customAppBar('إضافة مدرس'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      ': الاسم',
                      textAlign: TextAlign.end,
                      style: FontStyleApp.whiteBold18
                          .copyWith(fontSize: getResponsiveText(context, 18)),
                    ),
                  ],
                ),
                const HorizontalDivider(
                  size: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                InfoTextField(
                  validator: (p0) {
                    if (p0!.isEmpty || p0 == '') {
                      return 'ادخل اسم المدرس';
                    }
                    return null;
                  },
                  controller: teacherName,
                  hintText: 'أسم المدرس',
                  iconData: FontAwesomeIcons.userPlus,
                ),
                const SizedBox(
                  height: 10,
                ),
                ColumnTeacherInfo(
                  validator: (p0) {
                    if (p0!.isEmpty || p0 == '') {
                      return 'ادخل عنوان المدرس';
                    }
                    return null;
                  },
                  controller: teacherAddress,
                  labelText: ': العنوان',
                  hintText: 'ادخل عنوان',
                  iconData: FontAwesomeIcons.locationDot,
                  horizntalSize: 64,
                ),
                const SizedBox(
                  height: 10,
                ),
                ColumnTeacherInfo(
                  keyboardType: TextInputType.number,
                  validator: (p0) {
                    if (p0!.isEmpty || p0 == '') {
                      return 'ادخل رقم المدرس';
                    }
                    return null;
                  },
                  controller: teacherPhone,
                  labelText: ': رقم الهاتف',
                  hintText: 'ادخل رقم',
                  iconData: FontAwesomeIcons.phone,
                  horizntalSize: 89,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          printingPermission = !printingPermission;
                        });
                      },
                      child: Text('السماح بالطباعة',
                          style: FontStyleApp.white18.copyWith(
                              fontSize: getResponsiveText(context, 18))),
                    ),
                    Checkbox(
                      value: printingPermission,
                      onChanged: (value) {
                        setState(() {
                          printingPermission = !printingPermission;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
                BlocConsumer<CubitTeacher, TeacherStatuses>(
                  builder: (context, state) {
                    if (state is LoadingStateTeacher) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return CustomButton(
                        onPressed: () {
                          if (globalKey.currentState!.validate()) {
                            context.read<CubitTeacher>().insertUsers(
                                  TeacherModel(
                                      password: ' ',
                                      name: teacherName.text,
                                      photo: kImage,
                                      phone: int.parse(teacherPhone.text),
                                      address: teacherAddress.text,
                                      verificationCode: 00,
                                      classesSubjects: {
                                        'مواد': [],
                                        'صف': [],
                                      },
                                      printingPermission: printingPermission),
                                );
                          }
                        },
                        title: 'حفظ',
                      );
                    }
                  },
                  listener: (context, state) {
                    if (state is SuccessStateTeacher) {
                      teacherName.text = '';
                      teacherPhone.text = '';
                      teacherAddress.text = '';
                      ScaffoldMessenger.of(context).showSnackBar(
                          showSnackBar(context, 'تم الاضفة بنجاح'));
                    }
                    if (state is FaliureStateTeacher) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          showSnackBar(context, 'حدث خطأ اثناء الاضافة'));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
