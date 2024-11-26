import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});
  static String id = 'LogInView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image(
            image: const AssetImage(klogo),
            fit: BoxFit.contain,
            height: MediaQuery.sizeOf(context).height * .25,
          )
        ],
      ),
    );
  }
}
