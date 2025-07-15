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

  Future<void> _generateWord(BuildContext context, int index) async {
    try {
      final subject = CubitSubject.subjectsCount[index];
      if (subject.courses.isEmpty) {
        throw Exception('لا يوجد أسئلة في هذه الدورة');
      }

      // طلب صلاحيات التخزين على أندرويد
      if (Platform.isAndroid) {
        final status = await Permission.manageExternalStorage.request();
        if (!status.isGranted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("يجب منح صلاحية التخزين أولاً"),
              action: SnackBarAction(
                label: 'فتح الإعدادات',
                onPressed: () {
                  openAppSettingsDialog(context);
                },
              ),
            ),
          );
          return;
        }
      }

      // بناء محتوى ملف الـ Word بصيغة XML كما في الكود الأول
      final buffer = StringBuffer();

      buffer.writeln(r'''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>''');

      // عنوان الدورة
      buffer.writeln('''
    <w:p>
      <w:r>
        <w:b/>
        <w:color w:val="2E74B5"/>
        <w:sz w:val="32"/>
        <w:t>اسم الدورة: ${subject.nameSubject}</w:t>
      </w:r>
    </w:p>
    ''');

      int counter = 1;
      for (var course in subject.courses) {
        final question = course['question'];
        final answers = course['answers'];

        if (question == null || answers == null) continue;

        buffer.writeln('''
    <w:p>
      <w:r>
        <w:b/>
        <w:color w:val="2E74B5"/>
        <w:sz w:val="28"/>
        <w:t>سؤال $counter: $question</w:t>
      </w:r>
    </w:p>
    ''');

        // عرض كل إجابة مع نقطة (bullet)
        for (final answer in answers) {
          buffer.writeln('''
    <w:p>
      <w:r>
        <w:t>• $answer</w:t>
      </w:r>
    </w:p>
    ''');
        }

        buffer.writeln('<w:p><w:r><w:t></w:t></w:r></w:p>'); // فراغ بين الأسئلة
        counter++;
      }

      buffer.writeln('''
  </w:body>
</w:document>
''');

      final documentXml = buffer.toString();

      // محتويات الملف كما هي
      const contentTypesXml =
          '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
  <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
  <Default Extension="xml" ContentType="application/xml"/>
  <Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>
</Types>
''';

      const relsXml = '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
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
          'word/document.xml', documentXml.length, utf8.encode(documentXml)));

      final zipData = ZipEncoder().encode(archive);
      if (zipData == null) throw Exception("فشل في ضغط الملف");

      String filePath;

      if (Platform.isAndroid) {
        final downloadsDirs = await getExternalStorageDirectories(
            type: StorageDirectory.downloads);
        final downloadsDir = downloadsDirs?.first;
        if (downloadsDir == null) {
          throw Exception('لم أتمكن من الوصول إلى مجلد التنزيلات');
        }
        filePath = '${downloadsDir.path}/courses_details.docx';
      } else if (Platform.isWindows) {
        final downloadsDir = await getDownloadsDirectory();
        if (downloadsDir == null) {
          throw Exception('لم أتمكن من الوصول إلى مجلد التنزيلات في ويندوز');
        }
        filePath = '${downloadsDir.path}/courses_details.docx';
      } else {
        final docDir = await getApplicationDocumentsDirectory();
        filePath = '${docDir.path}/courses_details.docx';
      }

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
          if (index >= CubitSubject.subjectsCount.length) {
            return const SizedBox.shrink();
          }

          final subject = CubitSubject.subjectsCount[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CardSubjects(
              isdownlod: true,
              onPressed: () => _generateWord(context, index),
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
