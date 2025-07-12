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

class ChangePhoneAdmin extends StatefulWidget {
  const ChangePhoneAdmin({super.key});
  static String id = 'ChangePhoneAdmin';

  @override
  State<ChangePhoneAdmin> createState() => _ChangePhoneAdminState();
}

class _ChangePhoneAdminState extends State<ChangePhoneAdmin> {
  late AdminModel admin;
  GlobalKey<FormState> globalKey = GlobalKey();
  TextEditingController oldPohne = TextEditingController();
  TextEditingController newPhone = TextEditingController();
  TextEditingController confirmNewPhone = TextEditingController();
  @override
  void initState() {
    admin = BlocProvider.of<AdminCubit>(context).admin;
    oldPohne.text = admin.adminPhone.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Scaffold(
        appBar: customAppBar('تغيير رقم الهاتف'),
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
                      labelText: ': رقم الهاتف القديم',
                      horizntalSize: 165,
                      controller: oldPohne,
                      hintText: 'رقم الهاتف القديم',
                      iconData: FontAwesomeIcons.lock,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ColumnTeacherInfo(
                      keyboardType: TextInputType.number,
                      labelText: ': رقم الهاتف الجديد',
                      horizntalSize: 160,
                      controller: newPhone,
                      validator: (p0) {
                        if (p0!.isEmpty || p0 == '') {
                          return 'الرجاء ادخال رقم جديد';
                        }
                        return null;
                      },
                      hintText: 'رقم الهاتف الجديد',
                      iconData: FontAwesomeIcons.lock,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ColumnTeacherInfo(
                      keyboardType: TextInputType.number,
                      labelText: ': تأكيد رقم الهاتف',
                      horizntalSize: 145,
                      validator: (p0) {
                        if (p0 != newPhone.text) {
                          return 'رقم الهاتف غير مطابق';
                        }
                        return null;
                      },
                      controller: confirmNewPhone,
                      hintText: ' تأكيد رقم الهاتف',
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
                            context, 'حدث خطأ اeناء تغيير الرقم اعد المحاولة'));
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
                                  'admin_phone',
                                  admin.adminPhone,
                                  newPhone.text);
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
}
