import 'package:equatable/equatable.dart';
import 'package:quizapp/models/subjects_generated_model.dart';

abstract class SubjectsStates extends Equatable {
  final List<SubjectsGeneratedModel>? subjects;

  const SubjectsStates({this.subjects});
  @override
  List<Object?> get props => [subjects];
}

class SubjectsSuccessState extends SubjectsStates {
  const SubjectsSuccessState({super.subjects});
}

class InitSubjectState extends SubjectsStates {
  InitSubjectState() : super(subjects: []);
}

class SubjectFaliureState extends SubjectsStates {}

class SubjectLoadingState extends SubjectsStates {}
