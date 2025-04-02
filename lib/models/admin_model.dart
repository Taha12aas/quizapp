class AdminModel {
  final int? id;
  final int adminPhone;
  final String adminPassword;
  final int? adminVerificationCode;
  AdminModel({
    this.id,
    this.adminVerificationCode,
    required this.adminPhone,
    required this.adminPassword,
  });
  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      id: json['id'],
      adminPhone: json['admin_phone'],
      adminPassword: json['admin_password'],
      adminVerificationCode: json['admin_verificationCode'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'admin_phone': adminPhone,
      'admin_password': adminPassword,
      'admin_verificationCode': adminVerificationCode
    };
  }
}
