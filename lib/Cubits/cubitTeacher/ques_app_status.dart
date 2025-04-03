
abstract class TeacherStatuses {}

class InitStateTeacher extends TeacherStatuses {}

class SuccessStateTeacher extends TeacherStatuses {
  final List<Map<String, dynamic>>? result;
  SuccessStateTeacher({
    this.result,
  });
}

class FaliureStateTeacher extends TeacherStatuses {}

class LoadingStateTeacher extends TeacherStatuses {}
