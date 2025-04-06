import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/Cubits/cubitSubject/cubit_subject.dart';
import 'package:quizapp/Cubits/cubitSubject/cubit_subject_status.dart';
import 'package:quizapp/Cubits/cubitTeacher/cubit_teacher.dart';
import 'package:quizapp/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:quizapp/Mobile/widgets/home_view/custom_drawer.dart';
import 'package:quizapp/Mobile/widgets/home_view/list_view_item_card_subject.dart';
import 'package:quizapp/Mobile/widgets/home_view/main_sections.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/main_view_app_bar.dart';
import 'package:quizapp/utils/responsive_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static String id = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<CubitSubject>(context).fetchSubject();
    BlocProvider.of<CubitTeacher>(context).fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //TODO:Create Refresh And NavBar
    return BlocBuilder<CubitSubject, SubjectsStates>(
      builder: (context, state) {
        if (state is SubjectsSuccessState) {
          return Scaffold(
            appBar: mainAppBar('الصفحة الرئيسية', context),
            drawer: const CustomDrawer(),
            body: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const MainSections(),
                  const SizedBox(height: 20),
                  Container(
                    width: 158,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(Icons.trending_up, color: kOrange),
                          const SizedBox(width: 8),
                          Text(
                            "أحدث النشاطات",
                            style: TextStyle(
                              fontSize: getResponsiveText(context, 18),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const ListViewItemCardSubject()
                ],
              ),
            ),
          );
        } else if (state is SubjectFaliureState) {
          return Scaffold(
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '😉 تأكد من اتصالك بالانترنت ',
                  style: FontStyleApp.orange25
                      .copyWith(fontSize: getResponsiveText(context, 25)),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .5,
                  child: CustomButton(
                    title: 'حاول مجدداً',
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        arguments: false,
                        context,
                        HomeView.id,
                        (route) => false,
                      );
                    },
                  ),
                )
              ],
            )),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: kOrange,
              ),
            ),
          );
        }
      },
    );
  }
}
