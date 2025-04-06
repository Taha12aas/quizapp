import 'package:quizapp/models/teacher_model.dart';

abstract class TeacherStatuses {}

class InitStateTeacher extends TeacherStatuses {}

class SuccessStateTeacher extends TeacherStatuses {
  final List<TeacherModel>? teachers;
  SuccessStateTeacher({
    this.teachers,
  });
}

class FaliureStateTeacher extends TeacherStatuses {}

class LoadingStateTeacher extends TeacherStatuses {}
