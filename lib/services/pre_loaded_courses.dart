import 'package:supabase_flutter/supabase_flutter.dart';

class PreLoadedCoursesService {
  static final SupabaseClient supabase = Supabase.instance.client;

  static Future<List<Map<String, dynamic>>> fetchPreLoadedCourses(
      int teacherNumber) async {
    final response = await supabase
        .from('pre_loaded_course')
        .select()
        .eq('teacher_phone', teacherNumber);
    return response;
  }
}
