import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/Cubits/cubitSubject/cubit_subject_status.dart';
import 'package:quizapp/models/subjects_generated_model.dart';
import 'package:quizapp/services/subject_service.dart';

class CubitSubject extends Cubit<SubjectsStates> {
  CubitSubject() : super(InitSubjectState());
  static late List<Map<String, dynamic>> result;
  static late List<SubjectsGeneratedModel> subjectsCount;
  void fetchSubject() async {
    subjectsCount = [];
    emit(SubjectLoadingState());
    try {
      result = await SubjectService.fetchSubject();
      for (var i = 0; i < result.length; i++) {
        subjectsCount.add(SubjectsGeneratedModel.fromJson(result[i]));
      }
      emit(SubjectsSuccessState(subjects: subjectsCount));
    } catch (e) {
      log(e.toString());
      emit(SubjectFaliureState());
    }
  }
}
