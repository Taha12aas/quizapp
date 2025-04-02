class AdminModel {
  final int adminPhone;
  final String adminPassword;
  final int? adminVerificationCode;
  AdminModel({
    this.adminVerificationCode,
    required this.adminPhone,
    required this.adminPassword,
  });
  factory AdminModel.fromJson(json) {
    return AdminModel(
      adminPhone: json['admin_phone'],
      adminPassword: json['admin_password'],
      adminVerificationCode: json['admin_verificationCode'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'admin_phone': adminPhone,
      'admin_password': adminPassword,
      'admin_verificationCode': adminVerificationCode
    };
  }
}
