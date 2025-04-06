import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:quizapp/Mobile/views/reading_generated_questions.dart';
import 'package:quizapp/Mobile/widgets/home_view/teacher_card.dart'
    show CardSubjects;
import 'package:quizapp/models/subjects_generated_model.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList({
    super.key,
    required this.subjectsInfo,
  });
  final List<SubjectsGeneratedModel> subjectsInfo;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subjectsInfo.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CardSubjects(
              onPressed: () async {
                List courses = subjectsInfo[index].courses;
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
                            'اسم الدورة : ${subjectsInfo[index].nameSubject}',
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
              onTap: () {
                Navigator.pushNamed(context, ReadingGeneratedQuestionsView.id,
                    arguments: [
                      subjectsInfo[index].nameSubject,
                      subjectsInfo[index].classSabject,
                      subjectsInfo[index].coursesDate,
                      subjectsInfo[index].seasonSubject,
                      subjectsInfo[index].generateTime
                    ]);
              },
              subject: subjectsInfo[index].nameSubject,
              classTeacher: subjectsInfo[index].classSabject,
              courseDate: subjectsInfo[index].coursesDate,
              seasonSubject: subjectsInfo[index].seasonSubject,
              isdownlod: true),
        );
      },
    );
  }
}
