import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/horizontal_divider.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/custom_app_bar.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});
  static String id = 'AboutView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('حول التطبيق'),
      body: SafeArea(
        child: Center(
            child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    klogo,
                    height: 100,
                  ),
                  Text(
                    'Quiz App',
                    style: FontStyleApp.orange18.copyWith(
                        fontSize: getResponsiveText(
                          context,
                          24,
                        ),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'version 1.0.0',
                    style: FontStyleApp.orange18.copyWith(
                        fontSize: getResponsiveText(
                          context,
                          16,
                        ),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  HorizontalDivider(
                    size: MediaQuery.sizeOf(context).width * .5,
                    color: kOrange,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    ''' تطبيقنا يقدّم حلاً متكاملاً لإدارة المدرّسين داخل المؤسسة التعليمية. يتيح للمسؤولين ومشرفي النظام بالاطلاع على المدرسين والاسئلة الامتحانية.''',
                    style: FontStyleApp.white15.copyWith(
                        fontSize: getResponsiveText(
                      context,
                      18,
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '''التطبيق يتميز بواجهة بسيطة وسهلة الاستخدام، ويهدف إلى تحسين التواصل وتنظيم العمل داخل الكادر التعليمي بطريقة ذكية وفعّالة.''',
                    style: FontStyleApp.white18.copyWith(
                        fontSize: getResponsiveText(
                      context,
                      16,
                    )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text(
                        'مطوري التطبيق :',
                        style: FontStyleApp.white18.copyWith(
                            fontSize: getResponsiveText(
                          context,
                          16,
                        )),
                      ),
                    ],
                  ),
                  Text('طه فاخوري',
                      style: FontStyleApp.orange10.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: getResponsiveText(
                            context,
                            18,
                          ))),
                  Text('سليم عويجان',
                      style: FontStyleApp.orange10.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: getResponsiveText(
                            context,
                            18,
                          ))),
                  Text('طه حوراني',
                      style: FontStyleApp.orange10.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: getResponsiveText(
                            context,
                            18,
                          ))),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
