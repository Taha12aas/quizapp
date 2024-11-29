import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/auth_text_field.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/logo_image.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/register_or_log_in.dart';
import 'package:quizapp/font_style.dart';
import 'package:quizapp/responsive_text.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});
  static String id = 'LogInView';

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
                        'تسجيل الدخول',
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
                  const RegisterOrLogIn(
                    label1: 'ليس لديك حساب ؟',
                    label2: 'اضغط هنا لانشاء حساب',
                  ),
                  const Spacer(),
                  const CustomButton(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
