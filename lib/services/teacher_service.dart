import 'package:flutter/material.dart';
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
  static Future<void> updateMultiValue(
      Map columnsValue, String teacherName) async {
    final data = await supabase
        .from('teachers')
        .update(columnsValue).eq('name', teacherName);
  }
    static Future<void> deleteSubjectInTeacher(
 String teacherName, dynamic subjectName,String subjectClass) async {
    final data = await supabase
        .from('teachers')
        .delete() .eq('name', teacherName,);
    debugPrint('تمت تعديل البيانات: $data');
  }
}
