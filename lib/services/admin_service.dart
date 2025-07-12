import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quizapp/models/teacher_model.dart';
import 'package:quizapp/services/send_code.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminService {
  static final SupabaseClient supabase = Supabase.instance.client;

  static Future<List<Map<String, dynamic>>> fetchAdmin(int adminNumber) async {
    final response =
        await supabase.from('admin').select().eq('admin_phone', adminNumber);
    return response;
  }

  Future<void> createTeacher(TeacherModel teacher) async {
    try {
      await supabase.from('teachers').insert([teacher.toJson()]);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> updateAdmin(
      String columnName, int adminPhone, dynamic value) async {
    await supabase
        .from('admin')
        .update({columnName: value}).eq('admin_phone', adminPhone);
  }

  // ignore: body_might_complete_normally_nullable
  static Future<int?> sendVerificationCode(int phoneNumber) async {
    try {
      int verificationCode = Random().nextInt(9000) + 1000;
      await updateTeacherVerificationCode(phoneNumber, verificationCode);
      String message = 'Your verification code is: $verificationCode';
      await sendWhatsAppMessage(phoneNumber.toString(), message);
      return verificationCode;
    } catch (e) {
      debugPrint(
          '----------------------------حدث خطأ أثناء إرسال رمز التحقق: $e');
    }
  }

  static Future<void> updateTeacherVerificationCode(
      int adminPhone, int verificationCode) async {
    try {
      await supabase
          .from('admin')
          .update({'admin_verificationCode': verificationCode})
          .eq('admin_phone', adminPhone)
          .select();
    } catch (e) {
      debugPrint('حدث خطأ أثناء تحديث رمز التحقق في قاعدة البيانات: $e');
    }
  }
}
