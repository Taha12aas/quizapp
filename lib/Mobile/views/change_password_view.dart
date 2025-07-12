import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:quizapp/Cubits/cubitTeacher/cubit_teacher.dart';
import 'package:quizapp/Mobile/views/home_view.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/column_teacher_info.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:quizapp/models/teacher_model.dart';
import 'package:quizapp/utils/custom_app_bar.dart';
import 'package:quizapp/utils/show_snack_bar.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});
  static String id = 'ChangePasswordView';

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  String oldPassword = '';
  String newPassword = '';
  String confirmPassword = '';
  TextEditingController oldPass = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  late TeacherModel teacherModel;
  @override
  void didChangeDependencies() {
    teacherModel = ModalRoute.of(context)!.settings.arguments as TeacherModel;
    oldPass.text = teacherModel.password!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Scaffold(
        appBar: customAppBar('تغيير كلمة المرور'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ColumnTeacherInfo(
                      labelText: ': كلمة المرور القديمة',
                      horizntalSize: 165,
                      controller: oldPass,
                      validator: validateToPasswordOld,
                      hintText: 'كلمة المرور القديمة',
                      iconData: FontAwesomeIcons.lock,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ColumnTeacherInfo(
                      labelText: ': كلمة المرور الجديدة',
                      horizntalSize: 160,
                      controller: TextEditingController(),
                      validator: validateToPasswordNew,
                      hintText: 'كلمة المرور الجديدة',
                      iconData: FontAwesomeIcons.lock,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ColumnTeacherInfo(
                      labelText: ': تأكيد كلمة المرور',
                      horizntalSize: 145,
                      controller: TextEditingController(),
                      validator: validateToPasswordConfirm,
                      hintText: 'تأكيد كلمة المرور',
                      iconData: FontAwesomeIcons.lock,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomButton(
                    title: 'حفظ',
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        if (oldPassword == teacherModel.password!) {
                          context.read<CubitTeacher>().updateUsers(
                              'password', teacherModel.name, newPassword);
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeView.id,
                            (route) => false,
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(showSnackBar(
                            context,
                            'كلمة المرور القديمة خاطئة',
                          ));
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? validateToPasswordConfirm(passwordd) {
    if (passwordd != newPassword) {
      return 'كلمة المرور غير متطابقة';
    }

    confirmPassword = passwordd;
    return null;
  }

  String? validateToPasswordNew(password2) {
    if (password2 == null || password2.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (password2.length < 8) {
      return 'كلمة المرور يجب أن تكون أطول من 8 محارف';
    }
    final hasUpperCase = password2.contains(RegExp(r'[A-Z]'));
    final hasLowerCase = password2.contains(RegExp(r'[a-z]'));
    final hasDigits = password2.contains(RegExp(r'[0-9]'));
    final hasSpecialCharacters = password2.contains(RegExp(r'[!@#\$&*~]'));

    if (!hasUpperCase) {
      return 'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل';
    }
    if (!hasLowerCase) {
      return 'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل';
    }
    if (!hasDigits) {
      return 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل';
    }
    if (!hasSpecialCharacters) {
      return 'يجب أن تحتوي كلمة المرور على رمز خاص واحد على الأقل';
    }

    newPassword = password2;
    return null;
  }

  String? validateToPasswordOld(passwordd) {
    if (passwordd == null || passwordd.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }

    oldPassword = passwordd;
    return null;
  }
}
