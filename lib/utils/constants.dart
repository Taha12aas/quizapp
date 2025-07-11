import 'package:flutter/material.dart';

const kOrange =
    Color.fromARGB(255, 235, 112, 47); //Color.fromARGB(255, 235, 112, 47);
const kAshen = Color(0xff2A2F3A);
const kBackGround = Color(0xff1B202A);
const kOrangeBlack = Color(0xff251E1A);
const kBlack = Colors.black;
const kWhite = Colors.white;
const kred = Colors.red;
const klogo = 'assets/images/loogo.png';
const kImage =
    'https://static.vecteezy.com/system/resources/thumbnails/039/612/043/small/ai-generated-portrait-of-professional-teacher-on-transparent-background-image-free-png.png';
const List<String> kClassesPrimaryStage = [
  'اول',
  'ثاني',
  'ثالث',
  'رابع',
  'خامس',
  'سادس',
];
const List<String> kClassesPreparatoryStage = [
  'سابع',
  'ثامن',
  'تاسع',
];
const List<String> kClassesSecondaryStage = [
  'عاشر',
  'حادي عشر',
  'بكالوريا',
];
const List<String> kPrimaryStage = [
  "اللغة الانكليزية",
  "رياضيات",
  "اللغة العربية",
  "اجتماعيات",
  "علوم",
  "التربية الدينية الاسلامية",
  "تربية فنية",
  "تربية موسيقية",
  "التربية الدينية المسيحية"
];
const List<String> kPreparatoryStage = [
  "اللغة الانكليزية",
  "رياضيات",
  "اللغة العربية",
  "اللغة الفرنسية",
  "تاريخ",
  "جغرافيا",
  "وطنية",
  "معلوماتية",
  "علم الاحياء",
  "فيزياء",
  "كيمياء",
  "التربية الدينية الاسلامية",
  "التربية الدينية المسيحية",
  "تربية فنية",
  "تربية موسيقية",
];
const List<String> kSecondaryStage = [
  "اللغة الانكليزية",
  "جبر",
  "هندسة",
  "اللغة العربية",
  "تاريخ",
  "جغرافيا",
  "وطنية",
  "معلوماتية",
  "علم الاحياء",
  "فيزياء",
  "كيمياء",
  "التربية الدينية الاسلامية",
  "التربية الدينية المسيحية",
  "فلسفة",
];

const Map<String, List<String>> kSchoolSubjects = {
  'اول': kPrimaryStage,
  'ثاني': kPrimaryStage,
  'ثالث': kPrimaryStage,
  'رابع': kPrimaryStage,
  'خامس': kPrimaryStage,
  'سادس': kPrimaryStage,
  'سابع': kPreparatoryStage,
  'ثامن': kPreparatoryStage,
  'تاسع': kPreparatoryStage,
  'عاشر': kSecondaryStage,
  'حادي عشر': kSecondaryStage,
  'بكلوريا': kSecondaryStage,
};
