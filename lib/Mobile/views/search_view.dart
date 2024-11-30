import 'package:flutter/material.dart';
import 'package:quizapp/custom_app_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static String id = 'SearchView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        'بحث',
        false,
        () {},
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
