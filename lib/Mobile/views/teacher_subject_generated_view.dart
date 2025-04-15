import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:quizapp/Cubits/cubitSubject/cubit_subject.dart';
import 'package:quizapp/Cubits/cubitSubject/cubit_subject_status.dart';
import 'package:quizapp/Mobile/widgets/generated_question.dart/questions_list.dart';
import 'package:quizapp/models/subjects_generated_model.dart';
import 'package:quizapp/models/teacher_model.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/custom_app_bar.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class TeacherSubjectGeneratedView extends StatefulWidget {
  const TeacherSubjectGeneratedView({super.key});
  static String id = 'TeacherSubjectGeneratedView';
  @override
  State<TeacherSubjectGeneratedView> createState() =>
      _TeacherSubjectGeneratedView();
}

class _TeacherSubjectGeneratedView extends State<TeacherSubjectGeneratedView> {
  late List teacherInfo;
  late TeacherModel teacher;
  late String classTeacher;
  late String subjectName;
  @override
  void didChangeDependencies() {
    teacherInfo = ModalRoute.of(context)!.settings.arguments as List;
    teacher = teacherInfo[0];
    classTeacher = teacherInfo[1];
    subjectName = teacherInfo[2];
    super.didChangeDependencies();
  }

  List<SubjectsGeneratedModel> _filterSubjects() {
    return CubitSubject.subjectsCount
        .where((item) =>
            item.classSabject == classTeacher &&
            item.nameSubject == subjectName &&
            item.nameTeacher == teacher.name)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(subjectName),
      body: BlocBuilder<CubitSubject, SubjectsStates>(
        builder: (context, state) {
          return LiquidPullToRefresh(
            animSpeedFactor: 10,
            backgroundColor: kAshen,
            color: kOrange,
            showChildOpacityTransition: false,
            onRefresh: () async {
              BlocProvider.of<CubitSubject>(context)
                  .fetchSubject(refresh: true);
            },
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: _filterSubjects().isEmpty
                  ? SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                        child: Center(
                          child: Text(
                            'لا يوجد مواد مولدة',
                            style: FontStyleApp.orange25.copyWith(
                                fontSize: getResponsiveText(context, 25)),
                          ),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        const SizedBox(height: 15),
                        Expanded(
                          child: QuestionsList(subjectsInfo: _filterSubjects()),
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
