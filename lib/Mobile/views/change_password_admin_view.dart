import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:quizapp/Cubits/admin/admin_cubit.dart';
import 'package:quizapp/Cubits/admin/admin_statuses.dart';
import 'package:quizapp/Mobile/views/log_in_view.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/column_teacher_info.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:quizapp/models/admin_model.dart';
import 'package:quizapp/utils/custom_app_bar.dart';
import 'package:quizapp/utils/show_snack_bar.dart';

class ChangePasswordAdminView extends StatefulWidget {
  const ChangePasswordAdminView({super.key});
  static String id = 'ChangePasswordAdminView';

  @override
  State<ChangePasswordAdminView> createState() =>
      _ChangePasswordAdminViewState();
}

class _ChangePasswordAdminViewState extends State<ChangePasswordAdminView> {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  late AdminModel admin;

  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  void initState() {
    admin = BlocProvider.of<AdminCubit>(context).admin;
    oldPassword.text = admin.adminPassword;
    super.initState();
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
                      canRead: true,
                      labelText: ': كلمة المرور القديمة',
                      horizntalSize: 165,
                      controller: oldPassword,
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
                      controller: newPassword,
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
                      controller: confirmPassword,
                      validator: validateToPasswordConfirm,
                      hintText: 'تأكيد كلمة المرور',
                      iconData: FontAwesomeIcons.lock,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  BlocConsumer<AdminCubit, AdminStatuses>(
                    listener: (context, state) {
                      if (state is AdminSuccessStatus) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          LogInView.id,
                          (route) => false,
                        );
                      }
                      if (state is AdminFaliureStatus) {
                        ScaffoldMessenger.of(context).showSnackBar(showSnackBar(
                            context,
                            'حدث خطأ ا ثناء تغيير كلمة المرور اعد المحاولة'));
                      }
                    },
                    builder: (context, state) {
                      if (state is AdminLoadingStatus) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return CustomButton(
                          title: 'حفظ',
                          onPressed: () {
                            if (globalKey.currentState!.validate()) {
                              context.read<AdminCubit>().updateAdmin(
                                  'admin_password',
                                  admin.adminPhone,
                                  newPassword.text);
                            }
                          },
                        );
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
    if (passwordd != newPassword.text) {
      return 'كلمة المرور غير متطابقة';
    }

    confirmPassword.text = passwordd;
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

    newPassword.text = password2;
    return null;
  }
}
