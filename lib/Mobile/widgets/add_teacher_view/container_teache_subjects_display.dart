import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/container_class_and_subject.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/responsive_text.dart';

class ContainerTeacherSubjectsDisplay extends StatelessWidget {
  const ContainerTeacherSubjectsDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      width: MediaQuery.of(context).size.width * 0.99,
      height: MediaQuery.of(context).size.height * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17),
        child: Column(
          children: [
            Container(
              color: kOrangeColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    'المادة',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getResponsiveText(context, 19),
                        color: Colors.white),
                  ),
                  const Spacer(),
                  Text('الصف',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getResponsiveText(context, 19),
                          color: Colors.white)),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.circleMinus,
                      size: getResponsiveText(context, 12),
                    ),
                  ),
                ],
              ),
            ),
            const ContainerClassAndSubject(classs: 'الأول', subject: 'عربي'),
            const ContainerClassAndSubject(
              classs: 'الثاني',
              subject: 'علوم',
              color: Color.fromARGB(255, 226, 230, 232),
            )
          ],
        ),
      ),
    );
  }
}
