class TeacherModel {
  int? id;
  final String name;
  String photo;
  final int phone;
  final String address;
  final String? password;
  final int verificationCode;
  final Map<String, dynamic> classesSubjects;
  final bool printingPermission;
  TeacherModel({
    this.id,
    required this.name,
    required this.photo,
    required this.phone,
    required this.address,
    this.password,
    required this.verificationCode,
    required this.classesSubjects,
    required this.printingPermission,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      name: json['name'],
      photo: json['photo'],
      phone: json['phone'],
      address: json['address'],
      password: json['password'],
      verificationCode: json['verificationCode'],
      classesSubjects: json['classes_subjects'],
      printingPermission: json['printing_permission'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'photo': photo,
      'phone': phone,
      'address': address,
      'password': password,
      'verificationCode': verificationCode,
      'classes_subjects': classesSubjects,
      'printing_permission': printingPermission
    };
  }
}
