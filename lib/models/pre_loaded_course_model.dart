class PreLoadedCourseModel {
  final List<dynamic> courses;
  final String subjectName;
  final String courseHistory;
  final int teacherPhone;
  final String season;
  final String subjectClass;

  PreLoadedCourseModel( 
      {required this.courses,
    required  this.subjectClass,
      required this.subjectName,
      required this.courseHistory,
      required this.teacherPhone,
      required this.season});

  factory PreLoadedCourseModel.fromJson(json) {
    return PreLoadedCourseModel(subjectClass: json['subject_claas'],
        courses: json['course'],
        subjectName: json['cubject_name'],
        courseHistory: json['Course_history'],
        teacherPhone: json['teacher_phone'],
        season: json['season']);
  }
  Map<String, dynamic> toJson() {
    return {
      'subject_claas':subjectClass,
      'course': courses,
      'cubject_name': subjectName,
      'Course_history': courseHistory,
      'teacher_phone': teacherPhone,
      'season': season,
    };
  }
}
