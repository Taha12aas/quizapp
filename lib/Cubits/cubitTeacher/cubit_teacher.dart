import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/Cubits/cubitTeacher/ques_app_status.dart';
import 'package:quizapp/services/teacher_service.dart';

class CubitTeacher extends Cubit<TeacherStatuses> {
  CubitTeacher() : super(InitStateTeacher());

  static late List<Map<String, dynamic>> result;
  static int? verificationCode;
  void fetchUsers() async {
    emit(LoadingStateTeacher());
    try {
      result = await TeacherService.fetchTeacher();
      log('------------Fetch User Data-----------------');
      emit(SuccessStateTeacher(result: result));
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
