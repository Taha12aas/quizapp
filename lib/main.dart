import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/Cubits/admin/admin_cubit.dart';
import 'package:quizapp/Mobile/views/add_teacher_view.dart';
import 'package:quizapp/Mobile/views/generated_questions_view.dart';
import 'package:quizapp/Mobile/views/home_view.dart';
import 'package:quizapp/Mobile/views/log_in_view.dart';
import 'package:quizapp/Mobile/views/subjects_view.dart';
import 'package:quizapp/Mobile/views/teacher_profile_view.dart';
import 'package:quizapp/Mobile/views/teacher_subjects_view.dart';
import 'package:quizapp/Mobile/views/teachers_view.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // تعيين شريط النظام بشكل صريح
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: kBackGround, // إزالة اللون الأبيض في شريط الحالة
    systemNavigationBarColor:
        kBackGround, // إزالة اللون الأبيض في شريط التنقل السفلي
    systemNavigationBarIconBrightness:
        Brightness.dark, // ضبط سطوع الأيقونات في شريط التنقل
  ));
  await Supabase.initialize(
    url: 'https://gewushokramjbiqcbpng.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imdld3VzaG9rcmFtamJpcWNicG5nIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQwNjQ1MjksImV4cCI6MjA0OTY0MDUyOX0.9v7QMV8NgGhSgBnGRqZKxr2GNSLY1dZcgvm-ioIkdXg',
  );
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AdminCubit(),
        )
      ],
      child: MaterialApp(
        routes: {
          HomeView.id: (context) => const HomeView(),
          LogInView.id: (context) => const LogInView(),
          AddTeacherView.id: (context) => const AddTeacherView(),
          SubjectsView.id: (context) => const SubjectsView(),
          TeacherSubjects.id: (context) => const TeacherSubjects(),
          TeachersView.id: (context) => const TeachersView(),
          GeneratedQuestionsView.id: (context) =>
              const GeneratedQuestionsView(),
          TeacherProfileView.id: (context) => const TeacherProfileView(),
        },
        theme: ThemeData(
            scaffoldBackgroundColor: kBackGround,
            fontFamily: 'Exo2',
            iconButtonTheme: IconButtonThemeData(
                style:
                    ButtonStyle(iconColor: WidgetStateProperty.all(kWhite)))),
        debugShowCheckedModeBanner: false,
        initialRoute: LogInView.id,
      ),
    );
  }
}
