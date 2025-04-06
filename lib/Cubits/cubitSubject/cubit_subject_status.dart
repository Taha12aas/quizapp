import 'package:quizapp/models/subjects_generated_model.dart';

abstract class SubjectsStates {}

class SubjectsSuccessState extends SubjectsStates {
  final List<SubjectsGeneratedModel>? subjects;

  SubjectsSuccessState({
    this.subjects,
  });
}

class InitSubjectState extends SubjectsStates {}

class SubjectFaliureState extends SubjectsStates {}

class SubjectLoadingState extends SubjectsStates {}
