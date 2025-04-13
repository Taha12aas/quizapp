import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:quizapp/Mobile/widgets/home_view/row_home_view.dart';
import 'package:quizapp/utils/constants.dart';

class CardSubjects extends StatelessWidget {
  const CardSubjects({
    super.key,
    required this.onTap,
    required this.subject,
    required this.classTeacher,
    required this.courseDate,
    required this.seasonSubject,
    this.onPressed,
    required this.isdownlod,
  });

  final void Function() onTap;
  final String subject;
  final String classTeacher;
  final String courseDate;
  final String seasonSubject;
  final void Function()? onPressed;
  final bool isdownlod;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Bounceable(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.12,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 5.0,
              offset: const Offset(3, 3),
            ),
          ],
          border: Border.all(
            color: kOrangeBlack,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(12),
          color: kAshen,
        ),
        child: Row(
          children: [
            SizedBox(
              width: screenWidth * 0.05,
            ),
            IconButton(
              color: kOrange,
              iconSize: 30,
              onPressed: onPressed,
              icon: isdownlod
                  ? const Icon(
                      color: kOrange,
                      Icons.download,
                    )
                  : const SizedBox(),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RowText(
                              mainAxisAlignment: MainAxisAlignment.end,
                              classAndSubject: courseDate,
                              subjectName: ' : دورة ',
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            RowText(
                              mainAxisAlignment: MainAxisAlignment.end,
                              classAndSubject: seasonSubject,
                              subjectName: ': فصل',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RowText(
                              mainAxisAlignment: MainAxisAlignment.end,
                              classAndSubject: subject,
                              subjectName: ' : المادة',
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            RowText(
                              mainAxisAlignment: MainAxisAlignment.end,
                              classAndSubject: classTeacher,
                              subjectName: ': صف',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const RowText(
                    mainAxisAlignment: MainAxisAlignment.end,
                    classAndSubject: 'taha',
                    subjectName: ' : المدرس',
                  ),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.05)
          ],
        ),
      ),
    );
  }
}
