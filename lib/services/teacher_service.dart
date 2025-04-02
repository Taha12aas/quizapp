import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TeacherService {
  static final SupabaseClient supabase = Supabase.instance.client;

  static Future<List<Map<String, dynamic>>> fetchTeacher(
      int teacherNumber) async {
    final response =
        await supabase.from('teachers').select().eq('phone', teacherNumber);

    debugPrint('Response: $response');
    
    debugPrint(response.length.toString());
    return response;
  }

  static Future<void> updateTeacher(
      String columnName, String teacherName, dynamic value) async {
    final data = await supabase
        .from('teachers')
        .update({columnName: value}).eq('name', teacherName);
    debugPrint('تمت تعديل البيانات: $data');
  }

}
