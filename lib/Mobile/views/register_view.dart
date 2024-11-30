import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:quizapp/Mobile/views/log_in_view.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/auth_text_field.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/logo_image.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/register_or_log_in.dart';
import 'package:quizapp/font_style.dart';
import 'package:quizapp/responsive_text.dart';
import 'package:quizapp/show_snack_bar.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = 'RegisterView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const LogoImage(),
                  const SizedBox(height: 40),
                  Text(
                    'Quiz App',
                    textAlign: TextAlign.center,
                    style: FontStyleApp.appName
                        .copyWith(fontSize: getResponsiveText(context, 30)),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'انشاء حساب',
                        textAlign: TextAlign.end,
                        style: FontStyleApp.labels
                            .copyWith(fontSize: getResponsiveText(context, 18)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const AuthTextField(
                    hintText: 'رقم الهاتف',
                    iconData: FontAwesomeIcons.phone,
                  ),
                  const SizedBox(height: 18),
                  const AuthTextField(
                    hintText: 'كلمة المرور',
                    iconData: FontAwesomeIcons.lock,
                    obscureText: true,
                  ),
                  const SizedBox(height: 18),
                  const AuthTextField(
                    hintText: 'تأكيد كلمة المرور',
                    iconData: FontAwesomeIcons.lock,
                    obscureText: true,
                  ),
                  RegisterOrLogIn(
                    label1: 'لديك حساب؟',
                    label2: 'اضغط هنا لتسجيل الدخول',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  CustomButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          showSnackBar(context, 'تم انشاء الحساب بنجاح'));
                      Navigator.pushNamed(context, LogInView.id);
                    },
                  ),
                  const SizedBox(height: 65),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
