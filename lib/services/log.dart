import 'package:supabase_flutter/supabase_flutter.dart';

class LogInee {
  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    final supabase = Supabase.instance.client;

    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      if (response.user != null) {
        print("تم إنشاء الحساب بنجاح: ${response.user!.email}");
      }
    } catch (e) {
      print("خطأ في التسجيل: $e");
    }
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final supabase = Supabase.instance.client;

    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        print("تم تسجيل الدخول بنجاح: ${response.user!.email}");
      }
    } catch (e) {
      print("خطأ في تسجيل الدخول: $e");
    }
  }
}
