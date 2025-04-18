import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quizapp/Cubits/cubitTeacher/cubit_teacher.dart';
import 'package:quizapp/Cubits/cubitTeacher/ques_app_status.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/column_subject_check.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/container_teache_subjects_display.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:quizapp/models/teacher_model.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/custom_app_bar.dart';

class AddSubjectInTeacherView extends StatefulWidget {
  const AddSubjectInTeacherView({super.key});
  static String id = 'AddSubjectInTeacherView';

  @override
  State<AddSubjectInTeacherView> createState() =>
      _AddSubjectInTeacherViewState();
}

class _AddSubjectInTeacherViewState extends State<AddSubjectInTeacherView> {
  late TeacherModel teacherModel;
  final ValueNotifier<String> classValue = ValueNotifier('اول');
  final ValueNotifier<String?> subjectValue = ValueNotifier(null);
  final ValueNotifier<bool> isSubjectEnabled = ValueNotifier(true);

  @override
  void didChangeDependencies() {
    teacherModel = ModalRoute.of(context)!.settings.arguments as TeacherModel;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    classValue.addListener(_handleClassChange);
  }

  @override
  void dispose() {
    classValue.removeListener(_handleClassChange);
    classValue.dispose();
    subjectValue.dispose();
    isSubjectEnabled.dispose();
    super.dispose();
  }

  void _handleClassChange() {
    if (subjectValue.value != null &&
        !kSchoolSubjects[classValue.value]!.contains(subjectValue.value)) {
      subjectValue.value = null;
    }
    isSubjectEnabled.value = true;
  }

  @override
  Widget build(BuildContext context) {
      final ValueNotifier<List> newTeacherSubject = ValueNotifier(teacherModel.classesSubjects['مواد']);
  final ValueNotifier<List> newTeacherClass = ValueNotifier(teacherModel.classesSubjects['صف']);

    return BlocBuilder<CubitTeacher, TeacherStatuses>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state
              is LoadingStateTeacher, // true للتحميل، false للحالات الأخرى
          child: state is SuccessStateTeacher
              ? Scaffold(
                  appBar: customAppBar('اضافة مادة'),
                  body: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ValueListenableBuilder<String?>(
                              valueListenable: subjectValue,
                              builder: (context, subject, _) {
                                return ValueListenableBuilder<bool>(
                                  valueListenable: isSubjectEnabled,
                                  builder: (context, enabled, _) {
                                    return ValueListenableBuilder<String>(
                                      valueListenable: classValue,
                                      builder: (context, classVal, _) {
                                        return ColumnSubjectCheck(
                                          onChanged: (newSubject) {
                                            subjectValue.value = newSubject;
                                          },
                                          enabled: enabled,
                                          itemsSubject:
                                              kSchoolSubjects[classVal]!,
                                          horizntalSize: 52,
                                          title: ': المادة',
                                          selectedValue: subject,
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.022),
                            ValueListenableBuilder<String>(
                              valueListenable: classValue,
                              builder: (context, value, _) {
                                return ColumnSubjectCheck(
                                  onChanged: (newClass) {
                                    classValue.value = newClass!;
                                  },
                                  enabled: true,
                                  horizntalSize: 50,
                                  itemsSubject: kSchoolSubjects.keys.toList(),
                                  title: ': الصف',
                                  selectedValue: value,
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ContainerTeacherSubjectsDisplay(
                          classes: newTeacherClass.value,
                          subjects: newTeacherSubject.value,
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          title: 'إضافة مادة',
                          onPressed: () {
                            if (subjectValue.value != null) {
                            
                              newTeacherClass.value.add(classValue.value);

                         
                              newTeacherSubject.value.add(subjectValue.value!);

                              context.read<CubitTeacher>().updateUsers(
                                'classes_subjects',
                                teacherModel.name,
                                {
                                  'صف': newTeacherClass.value,
                                  'مواد': newTeacherSubject.value
                                },
                              );
                              
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : const Scaffold(),
        );
      },
    );
  }
}
