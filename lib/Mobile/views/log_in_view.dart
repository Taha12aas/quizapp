import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quizapp/Cubits/admin/admin_cubit.dart';
import 'package:quizapp/Cubits/admin/admin_statuses.dart';
import 'package:quizapp/Mobile/views/custom_button.dart';
import 'package:quizapp/Mobile/views/home_view.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/log_in_text_field.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/logo_image.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/show_snack_bar.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});
  static String id = 'LogInView';

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  bool isActiv = false;
  int phoneNumber = 0; //Create Controller
  String password = ''; //Create Controller
  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Scaffold(
        body: BlocListener<AdminCubit, AdminStatuses>(
          listener: (context, state) {
            isActiv = true;
            if (state is AdminLoadingStatus) {
            } else if (state is AdminSuccessStatus) {
              Navigator.pushReplacementNamed(context, HomeView.id);
            } else if (state is AdminFaliureStatus) {
              isActiv = false;
              ScaffoldMessenger.of(context).showSnackBar(
                showSnackBar(context, 'رقم الهاتف غير صحيح'),
              );
            }
          },
          child: BlocBuilder<AdminCubit, AdminStatuses>(
            builder: (context, state) {
              return ModalProgressHUD(
                progressIndicator: const CircularProgressIndicator(
                  color: kOrange,
                ),
                inAsyncCall: isActiv,
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.sizeOf(context).height),
                    child: IntrinsicHeight(
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18, right: 18, top: 120),
                          child: Column(
                            children: [
                              const LogoImage(),
                              const SizedBox(height: 20),
                              const SizedBox(height: 30),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'تسجيل الدخول',
                                      textAlign: TextAlign.end,
                                      style: ArabicTextStyle(
                                          arabicFont: ArabicFont.aalooBhaijaan,
                                          fontSize: 20,
                                          color: kOrange),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),
                              LogInTextField(
                                initialValue: '963988818024',
                                validator: validateToPhoneNumber,
                                hintText: '963988888888',
                                iconData: FontAwesomeIcons.phone,
                                keyboardType: true,
                              ),
                              const SizedBox(height: 18),
                              LogInTextField(
                                initialValue: 'Taha!@#taha123',
                                validator: validateToPassword,
                                hintText: 'كلمة المرور',
                                iconData: FontAwesomeIcons.lock,
                                obscureText: true,
                              ),
                              const Spacer(),
                              CustomButtonIcon(
                                label: 'تسجيل الدخول',
                                onPressed: () async {
                                  isActiv = true;
                                  if (globalKey.currentState!.validate()) {
                                    await BlocProvider.of<AdminCubit>(context)
                                        .featchAdmin(phoneNumber);
                                  }
                                },
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  String? validateToPassword(passwordd) {
    if (passwordd == null || passwordd.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (passwordd.length < 8) {
      return 'كلمة المرور يجب أن تكون أطول من 8 محارف';
    }
    final hasUpperCase = passwordd.contains(RegExp(r'[A-Z]'));
    final hasLowerCase = passwordd.contains(RegExp(r'[a-z]'));
    final hasDigits = passwordd.contains(RegExp(r'[0-9]'));
    final hasSpecialCharacters = passwordd.contains(RegExp(r'[!@#\$&*~]'));

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

    password = passwordd;
    return null;
  }

  String? validateToPhoneNumber(p0) {
    if (p0.isEmpty) {
      return 'رقم الهاتف مطلوب';
    } else if (p0!.length < 12 || p0.length > 12) {
      return 'الرجاء ادخال 12 رقم فقط';
    }
    phoneNumber = int.parse(p0);
    return null;
  }
}
