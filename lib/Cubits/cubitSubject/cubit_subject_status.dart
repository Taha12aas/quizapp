

abstract class SubjectsStates {}

class SubjectsSuccessState extends SubjectsStates {
  final List<Map<String, dynamic>>? subjects;

  SubjectsSuccessState({
    this.subjects,
  });
}

class InitSubjectState extends SubjectsStates {}
class SubjectFaliureState extends SubjectsStates {}

class SubjectLoadingState extends SubjectsStates {}
