import 'package:supabase_flutter/supabase_flutter.dart';

class SubjectService {
  static final SupabaseClient supabase = Supabase.instance.client;

  static Future<List<Map<String, dynamic>>> fetchSubject() async {
    final response = await supabase
        .from('subjects_generated')
        .select()
        .order('generate_time');
    return response;
  }
}
