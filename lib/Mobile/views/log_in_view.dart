import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/auth_text_field.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/logo_image.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/register_or_log_in.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/font_style.dart';
import 'package:quizapp/responsive_text.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});
  static String id = 'LogInView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            const LogoImage(),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Quiz App',
              textAlign: TextAlign.center,
              style: FontStyleApp.appName
                  .copyWith(fontSize: getResponsiveText(context, 30)),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'تسجيل الدخول',
              textAlign: TextAlign.end,
              style: FontStyleApp.labels
                  .copyWith(fontSize: getResponsiveText(context, 18)),
            ),
            const SizedBox(
              height: 18,
            ),
            const AuthTextField(
              hintText: 'رقم الهاتف',
              iconData: FontAwesomeIcons.phone,
            ),
            const SizedBox(
              height: 18,
            ),
            const AuthTextField(
              hintText: 'كلمة المرور',
              iconData: FontAwesomeIcons.lock,
              obscureText: true,
            ),
            const RegisterOrLogIn(
              label1: 'ليس لديك حساب ؟',
              label2: 'اضغط هنا لانشاء حساب',
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .25,
            ),
            ElevatedButton.icon(
              icon: Icon(
                Icons.login, // حدد أيقونة هنا
                color: kOrangeColor,
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.orange[50],
                side: const BorderSide(color: kOrangeColor, width: 2),
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 23),
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {},
              label: Text(
                'تسجيل الدخول',
                style: FontStyleApp.textFieldPadding.copyWith(
                  fontSize: getResponsiveText(context, 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
