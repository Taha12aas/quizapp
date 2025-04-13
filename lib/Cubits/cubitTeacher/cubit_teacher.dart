import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/Cubits/cubitTeacher/ques_app_status.dart';
import 'package:quizapp/models/teacher_model.dart';
import 'package:quizapp/services/teacher_service.dart';

class CubitTeacher extends Cubit<TeacherStatuses> {
  CubitTeacher() : super(InitStateTeacher());

  static late List<Map<String, dynamic>> _result;
  static late List<TeacherModel> teachers;
  void fetchUsers() async {
    teachers = [];
    emit(LoadingStateTeacher());
    try {
      _result = await TeacherService.fetchTeacher();
      for (var i = 0; i < _result.length; i++) {
        teachers.add(TeacherModel.fromJson(_result[i]));
      }
      emit(SuccessStateTeacher(teachers: teachers));
    } catch (e) {
      log(e.toString());
      emit(FaliureStateTeacher());
    }
  }

  void updateUsers(String columnName, String teacherName, dynamic value) async {
    emit(LoadingStateTeacher());
    try {
      await TeacherService.updateTeacher(columnName, teacherName, value);
      emit(LoadingStateTeacher());
    } catch (e) {
      emit(FaliureStateTeacher());
    }
  }
}
