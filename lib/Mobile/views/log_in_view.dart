import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/auth_text_field.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/logo_image.dart';
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
              height: 60,
            ),
            const AuthTextField(
              hintText: 'رقم الهاتف',
              iconData: FontAwesomeIcons.phone,
              textDirection: TextDirection.ltr,
              obscureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            const AuthTextField(
              hintText: 'كلمة المرور',
              iconData: FontAwesomeIcons.lock,
              textDirection: TextDirection.ltr,
              obscureText: true,
            )
          ],
        ),
      ),
    );
  }
}
