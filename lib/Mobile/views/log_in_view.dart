import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quizapp/Mobile/views/custom_button.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/log_in_text_field.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/logo_image.dart';
import 'package:quizapp/utils/constants.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});
  static String id = 'LogInView';

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  bool isActiv = false;
  int phoneNumber = 0;
  String password = '';
  GlobalKey<FormState> globalKey = GlobalKey();
  bool s = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Scaffold(
        body: ModalProgressHUD(
          progressIndicator: const CircularProgressIndicator(
            color: kOrange,
          ),
          inAsyncCall: isActiv,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18, top: 120),
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
                          iconData: Icons.login,
                          label: 'تسجيل الدخول',
                          onPressed: () {
                            if (globalKey.currentState!.validate()) {}
                          }),
                      const SizedBox(height: 65),
                    ],
                  ),
                ),
              ),
            ),
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
