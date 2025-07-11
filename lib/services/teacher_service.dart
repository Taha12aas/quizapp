import 'package:flutter/material.dart';
import 'package:quizapp/models/teacher_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TeacherService {
  static final SupabaseClient supabase = Supabase.instance.client;

  static Future<List<Map<String, dynamic>>> fetchTeacher() async {
    final response = await supabase.from('teachers').select();

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

  static Future<void> insertTeacher(TeacherModel teacher) async {
    await supabase.from('teachers').insert(teacher.toJson());
  }

  static Future<void> updateMultiValue(
      Map columnsValue, String teacherName) async {
    await supabase
        .from('teachers')
        .update(columnsValue)
        .eq('name', teacherName);
  }

  static Future<void> deleteTeacher(String teacherName) async {
    final data = await supabase.from('teachers').delete().eq(
          'name',
          teacherName,
        );
    debugPrint(
        'تمت تعديل البياsssssssssssssssssssssssssssssssssssssنات: $data');
  }
}
