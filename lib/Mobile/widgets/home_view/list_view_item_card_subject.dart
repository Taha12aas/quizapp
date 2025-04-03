import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/Cubits/cubitSubject/cubit_subject.dart';
import 'package:quizapp/Mobile/views/reading_generated_questions.dart';
import 'package:quizapp/Mobile/widgets/home_view/teacher_card.dart';
import 'package:path_provider/path_provider.dart';

import 'package:quizapp/utils/font_style.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:quizapp/utils/responsive_text.dart';

class ListViewItemCardSubject extends StatelessWidget {
  const ListViewItemCardSubject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (CubitSubject.result.isEmpty) {
      return Text(
        'لا يوجد اسئلة',
        style: FontStyleApp.orange18.copyWith(
          fontSize: getResponsiveText(context, 18),
        ),
      );
    } else {
      return Expanded(
          child: ListView.builder(
        itemCount:
            CubitSubject.result.length < 10 ? CubitSubject.result.length : 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CardSubjects(
              isdownlod: true,
              onPressed: () async {
                List courses = CubitSubject.result[index]['courses'];
                final arabicFont = pw.Font.ttf(
                  await rootBundle.load('assets/fonts/Amiri-Bold.ttf'),
                );
                final pdf = pw.Document();
                pdf.addPage(
                  pw.Page(
                    build: (pw.Context context) {
                      int questionCounter = 0;
                      return pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            'اسم الدورة : ${CubitSubject.result[index]['name_sabject']}',
                            style: pw.TextStyle(
                              fontSize: 24,
                              fontWeight: pw.FontWeight.bold,
                              font: arabicFont,
                            ),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.right,
                          ),
                          pw.SizedBox(height: 20),
                          ...courses.map((courseItem) {
                            questionCounter++;
                            return pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text(
                                  '$questionCounter ${courseItem['question']}', // افترض أن courseItem يحتوي على حقل 'name'
                                  style: pw.TextStyle(
                                    fontSize: 18,
                                    font: arabicFont,
                                  ),
                                  textDirection: pw.TextDirection.rtl,
                                  textAlign: pw.TextAlign.right,
                                ),
                                pw.Text(
                                  'الاجابات:\n ${courseItem['answers']}', // افترض أن courseItem يحتوي على حقل 'description'
                                  style: pw.TextStyle(
                                    fontSize: 16,
                                    font: arabicFont,
                                  ),
                                  textDirection: pw.TextDirection.rtl,
                                  textAlign: pw.TextAlign.right,
                                ),
                                pw.SizedBox(height: 10),
                              ],
                            );
                          }),
                        ],
                      );
                    },
                  ),
                );
                final outputDir = await getApplicationDocumentsDirectory();
                final filePath = '${outputDir.path}/courses_details.pdf';
                final file = File(filePath);
                await file.writeAsBytes(await pdf.save());
                print('File saved to $filePath');
              },
              courseDate: CubitSubject.result[index]['courses_date'],
              seasonSubject: CubitSubject.result[index]['season_subject'],
              subject: CubitSubject.result[index]['name_sabject'],
              classTeacher: CubitSubject.result[index]['class'],
              onTap: () {
                Navigator.pushNamed(context, ReadingGeneratedQuestionsView.id,
                    arguments: [
                      CubitSubject.result[index]['name_sabject'],
                      CubitSubject.result[index]['class'],
                      CubitSubject.result[index]['courses_date'],
                      CubitSubject.result[index]['season_subject'],
                      CubitSubject.result[index]['generate_time']
                    ]);
              },
            ),
          );
        },
      ));
    }
  }
}
