import 'package:flutter/material.dart';
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
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 50, left: 150),
              color: kOrangeColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'المادة',
                    style: TextStyle(
                        fontSize: getResponsiveText(context, 12),
                        color: Colors.white),
                  ),
                  Text('الصف',
                      style: TextStyle(
                          fontSize: getResponsiveText(context, 12),
                          color: Colors.white)),
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
