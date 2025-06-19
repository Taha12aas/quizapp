import 'dart:io';
import 'dart:math';
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
  const ListViewItemCardSubject({super.key});
  Future<void> _generatePdf(BuildContext context, int index) async {
    try {
      final subject = CubitSubject.subjectsCount[index];
      if (subject.courses.isEmpty) {
        throw Exception('لا يوجد أسئلة في هذه الدورة');
      }

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
                  'اسم الدورة : ${subject.nameSubject}',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                    font: arabicFont,
                  ),
                  textDirection: pw.TextDirection.rtl,
                  textAlign: pw.TextAlign.right,
                ),
                pw.SizedBox(height: 20),
                ...subject.courses.map((courseItem) {
                  if (courseItem == null ||
                      courseItem['question'] == null ||
                      courseItem['answers'] == null) {
                    return pw.SizedBox();
                  }
                  questionCounter++;
                  return pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        '$questionCounter ${courseItem['question']}',
                        style: pw.TextStyle(
                          fontSize: 18,
                          font: arabicFont,
                        ),
                        textDirection: pw.TextDirection.rtl,
                        textAlign: pw.TextAlign.right,
                      ),
                      pw.Text(
                        'الاجابات:\n ${courseItem['answers']}',
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

      String filePath;

      if (Platform.isAndroid) {
        // مجلد التنزيلات في أندرويد
        final downloadsDirs = await getExternalStorageDirectories(
          type: StorageDirectory.downloads,
        );
        final downloadsDir = downloadsDirs?.first;
        if (downloadsDir == null) {
          throw Exception('لم أتمكن من الوصول إلى مجلد التنزيلات');
        }
        filePath = '${downloadsDir.path}/courses_details.pdf';
      } else if (Platform.isWindows) {
        // مجلد التنزيلات في ويندوز
        final downloadsDir = await getDownloadsDirectory();
        if (downloadsDir == null) {
          throw Exception('لم أتمكن من الوصول إلى مجلد التنزيلات في ويندوز');
        }
        filePath = '${downloadsDir.path}/courses_details.pdf';
      } else {
        // مجلد المستندات للأنظمة الأخرى
        final docDir = await getApplicationDocumentsDirectory();
        filePath = '${docDir.path}/courses_details.pdf';
      }

      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم حفظ الملف بنجاح في $filePath')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (CubitSubject.subjectsCount.isEmpty) {
      return Center(
        child: Text(
          'لا يوجد أسئلة',
          style: FontStyleApp.orange18.copyWith(
            fontSize: getResponsiveText(context, 18),
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: min(10, CubitSubject.subjectsCount.length),
        itemBuilder: (context, index) {
          if (index >= CubitSubject.subjectsCount.length) {
            return const SizedBox.shrink();
          }

          final subject = CubitSubject.subjectsCount[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CardSubjects(
              isdownlod: true,
              onPressed: () => _generatePdf(context, index),
              courseDate: subject.coursesDate,
              seasonSubject: subject.seasonSubject,
              subject: subject.nameSubject,
              classTeacher: subject.classSabject,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ReadingGeneratedQuestionsView.id,
                  arguments: [
                    subject.nameSubject,
                    subject.classSabject,
                    subject.coursesDate,
                    subject.seasonSubject,
                    subject.generateTime
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
