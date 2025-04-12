// import 'package:flutter/material.dart';
// import 'package:quizapp/Cubits/cubitSubject/cubit_subject.dart';
// import 'package:quizapp/Mobile/widgets/generated_question.dart/questions_list.dart';
// import 'package:quizapp/models/subjects_generated_model.dart';
// import 'package:quizapp/utils/custom_app_bar.dart';
// import 'package:quizapp/utils/font_style.dart';
// import 'package:quizapp/utils/responsive_text.dart';

// class GeneratedQuestionsView extends StatefulWidget {
//   const GeneratedQuestionsView({super.key});
//   static String id = 'GeneratedQuestionsView';

//   @override
//   State<GeneratedQuestionsView> createState() => _GeneratedQuestionsViewState();
// }

// class _GeneratedQuestionsViewState extends State<GeneratedQuestionsView> {
//   late List<String> info;
//   late final List<SubjectsGeneratedModel> subjectsInfo = [];

//   @override
//   void didChangeDependencies() {
//     info = ModalRoute.of(context)!.settings.arguments as List<String>;
//     for (var i = 0; i < CubitSubject.subjectsCount.length; i++) {
//       if (info[1] == CubitSubject.subjectsCount[i].classSabject &&
//           info[0] == CubitSubject.subjectsCount[i].nameSubject) {
//         subjectsInfo.add(CubitSubject.subjectsCount[i]);
//       }
//     }
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: customAppBar(info[0]),
//       body: Padding(
//         padding: const EdgeInsets.all(18),
//         child: subjectsInfo.isEmpty
//             ? Center(
//                 child: Text(
//                   'لا يوجد مواد مولدة',
//                   style: FontStyleApp.orange25
//                       .copyWith(fontSize: getResponsiveText(context, 25)),
//                 ),
//               )
//             : Center(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 15),
//                     Expanded(
//                       child: QuestionsList(
//                         subjectsInfo: subjectsInfo,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:quizapp/Cubits/cubitSubject/cubit_subject.dart';
import 'package:quizapp/Cubits/cubitSubject/cubit_subject_status.dart';
import 'package:quizapp/Mobile/widgets/generated_question.dart/questions_list.dart';
import 'package:quizapp/models/subjects_generated_model.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/custom_app_bar.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class GeneratedQuestionsView extends StatefulWidget {
  const GeneratedQuestionsView({super.key});
  static String id = 'GeneratedQuestionsView';
  @override
  State<GeneratedQuestionsView> createState() => _GeneratedQuestionsViewState();
}

class _GeneratedQuestionsViewState extends State<GeneratedQuestionsView> {
  late List<String> info;

  @override
  void didChangeDependencies() {
    info = ModalRoute.of(context)!.settings.arguments as List<String>;
    super.didChangeDependencies();
  }

  List<SubjectsGeneratedModel> _filterSubjects() {
    return CubitSubject.subjectsCount
        .where((item) =>
            item.classSabject == info[1] && item.nameSubject == info[0])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(info[0]),
      body: BlocBuilder<CubitSubject, SubjectsStates>(
        builder: (context, state) {
          log('build');
          return LiquidPullToRefresh(
            animSpeedFactor: 10,
            backgroundColor: kAshen,
            color: kOrange,
            showChildOpacityTransition: false,
            onRefresh: () async {
              log('message');
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
