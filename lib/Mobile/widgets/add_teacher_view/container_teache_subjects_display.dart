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
      height: MediaQuery.of(context).size.height * 0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
                    flex: 4,
                  ),
                  Text(
                    'المادة',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getResponsiveText(context, 16),
                        color: Colors.white),
                  ),
                  const Spacer(),
                  Text('الصف',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getResponsiveText(context, 16),
                          color: Colors.white)),
                  const Spacer(
                    flex: 1,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.circleMinus,
                      size: getResponsiveText(context, 18),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  final color =
                      index.isEven ? Colors.white : const Color(0xffE4E4E4);
                  return ContainerClassAndSubject(
                      color: color, classs: 'الأول', subject: 'عربي');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
