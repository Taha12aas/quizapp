import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/logo_image.dart';
import 'package:quizapp/font_style.dart';
import 'package:quizapp/responsive_text.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});
  static String id = 'LogInView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
            style: FontStyleApp.textStyleOrangeBold25.copyWith(
              fontSize: getResponsiveText(context, 30),
            ),
          )
        ],
      ),
    );
  }
}
