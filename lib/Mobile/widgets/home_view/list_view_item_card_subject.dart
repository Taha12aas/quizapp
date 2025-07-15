import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quizapp/Cubits/cubitSubject/cubit_subject.dart';
import 'package:quizapp/Mobile/views/reading_generated_questions.dart';
import 'package:quizapp/Mobile/widgets/home_view/teacher_card.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class ListViewItemCardSubject extends StatelessWidget {
  const ListViewItemCardSubject({super.key});

  Future<void> openAppSettingsDialog(BuildContext context) async {
    bool opened = await openAppSettings();
    if (!opened) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("تعذر فتح إعدادات التطبيق")),
      );
    }
  }

  Future<void> _generateWord(
    BuildContext context,
    int index, {
    required String studentName,
    required String schoolName,
    required String courseDate,
  }) async {
    try {
      final subject = CubitSubject.subjectsCount[index];
      if (subject.courses.isEmpty) {
        throw Exception('لا يوجد أسئلة في هذه الدورة');
      }

      if (Platform.isAndroid) {
        final status = await Permission.manageExternalStorage.request();
        if (!status.isGranted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("يجب منح صلاحية التخزين أولاً"),
              action: SnackBarAction(
                label: 'فتح الإعدادات',
                onPressed: () => openAppSettingsDialog(context),
              ),
            ),
          );
          return;
        }
      }

      final buffer = StringBuffer();
      buffer.writeln(r'''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>''');

      String createRightAlignedParagraph(String text,
          {bool bold = false, int fontSize = 28}) {
        return '''
<w:p>
  <w:pPr>
    <w:jc w:val="right"/>
    <w:bidi/>
  </w:pPr>
  <w:r>
    <w:rPr>
      ${bold ? "<w:b/>" : ""}
      <w:sz w:val="$fontSize"/>
      <w:bidi/>
    </w:rPr>
    <w:t xml:lang="ar-SA" xml:space="preserve">$text</w:t>
  </w:r>
</w:p>''';
      }

      buffer.writeln(createRightAlignedParagraph('الجمهورية العربية السورية',
          bold: true, fontSize: 28));
      buffer.writeln(createRightAlignedParagraph('وزارة التربية',
          bold: true, fontSize: 26));
      buffer.writeln(
          createRightAlignedParagraph('مدرسة: $schoolName', bold: true));
      buffer.writeln(
          createRightAlignedParagraph('اسم الطالب: $studentName', bold: true));
      buffer.writeln(
          createRightAlignedParagraph('تاريخ الدورة: $courseDate', bold: true));
      buffer.writeln('<w:p><w:r><w:t></w:t></w:r></w:p>');

      buffer.writeln(createRightAlignedParagraph(
          'امتحان في مادة: ${subject.nameSubject}',
          bold: true,
          fontSize: 32));
      buffer.writeln(createRightAlignedParagraph(
          'الصف: ${subject.classSabject}    الفصل: ${subject.seasonSubject}'));
      buffer.writeln('<w:p><w:r><w:t></w:t></w:r></w:p>');

      int counter = 1;
      for (var course in subject.courses) {
        final question = course['question'];
        final answers = course['answers'];
        if (question == null || answers == null) continue;

        buffer.writeln(createRightAlignedParagraph('سؤال $counter: $question',
            bold: true, fontSize: 28));

        for (final answer in answers) {
          buffer.writeln(createRightAlignedParagraph('• $answer'));
        }

        buffer.writeln('<w:p><w:r><w:t></w:t></w:r></w:p>');
        counter++;
      }

      buffer.writeln('</w:body></w:document>');

      final contentTypesXml =
          '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
  <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
  <Default Extension="xml" ContentType="application/xml"/>
  <Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>
</Types>
''';

      final relsXml = '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>
</Relationships>
''';

      final archive = Archive();
      archive.addFile(ArchiveFile('[Content_Types].xml', contentTypesXml.length,
          utf8.encode(contentTypesXml)));
      archive.addFile(
          ArchiveFile('_rels/.rels', relsXml.length, utf8.encode(relsXml)));
      archive.addFile(ArchiveFile(
          'word/document.xml', buffer.length, utf8.encode(buffer.toString())));

      final zipData = ZipEncoder().encode(archive);
      if (zipData == null) throw Exception("فشل في ضغط الملف");

      final dir = Platform.isAndroid
          ? (await getExternalStorageDirectories(
                  type: StorageDirectory.downloads))
              ?.first
          : await getDownloadsDirectory();
      if (dir == null) throw Exception('لم أتمكن من تحديد مجلد الحفظ');

      final filePath = '${dir.path}/exam_questions.docx';
      final file = File(filePath);
      await file.writeAsBytes(zipData);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✅ تم حفظ ملف Word في: $filePath')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ حدث خطأ: ${e.toString()}')),
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
          final subject = CubitSubject.subjectsCount[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CardSubjects(
              isdownlod: true,
              onPressed: () => _generateWord(
                context,
                index,
                studentName: '_____________',
                schoolName: '_____________',
                courseDate: '00/00/0000',
              ),
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
