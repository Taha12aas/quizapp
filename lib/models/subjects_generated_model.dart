import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SubjectsGeneratedModel extends Equatable {
  int? id;
  final String nameSubject;
  final String coursesDate;
  final List<dynamic> courses;
  final String nameTeacher;
  final String classSabject;
  final String seasonSubject;
  final String generateTime;

  SubjectsGeneratedModel(
      {this.id,
      required this.nameSubject,
      required this.coursesDate,
      required this.courses,
      required this.nameTeacher,
      required this.classSabject,
      required this.seasonSubject,
      required this.generateTime});

  factory SubjectsGeneratedModel.fromJson(Map<String, dynamic> json) {
    return SubjectsGeneratedModel(
        seasonSubject: json['season_subject'],
        nameSubject: json['name_sabject'],
        coursesDate: json['courses_date'],
        courses: json['courses'],
        nameTeacher: json['name_teacher'],
        classSabject: json['class'],
        generateTime: json['generate_time']);
  }

  Map<String, dynamic> toJson() {
    return {
      'season_subject': seasonSubject,
      'name_sabject': nameSubject,
      'courses_date': coursesDate,
      'courses': courses,
      'name_teacher': nameTeacher,
      'class': classSabject,
      'generate_time': generateTime
    };
  }

  @override
  List<Object?> get props => [
        id,
        nameSubject,
        coursesDate,
        courses,
        nameTeacher,
        classSabject,
        seasonSubject,
        generateTime
      ];
}
