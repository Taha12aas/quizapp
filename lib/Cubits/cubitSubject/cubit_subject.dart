import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/Cubits/cubitSubject/cubit_subject_status.dart';
import 'package:quizapp/services/subject_service.dart';

class CubitSubject extends Cubit<SubjectsStates> {
  CubitSubject() : super(InitSubjectState());
  static late List<Map<String, dynamic>> result;
  void fetchSubject() async {
    emit(SubjectLoadingState());
    try {
      result = await SubjectService.fetchSubject();
      emit(SubjectsSuccessState(subjects: result));
    } catch (e) {
      log(e.toString());
      emit(SubjectFaliureState());
    }
  }
}
