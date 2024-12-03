
import 'package:flutter/material.dart';
import 'package:quizapp/utils/constants.dart';

class TeacherPhoto extends StatelessWidget {
  const TeacherPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius:  MediaQuery.sizeOf(context).height * .1,
      backgroundImage: const AssetImage('assets/images/TeachersTaha.jpg'),
      child: const Align(
        alignment: Alignment.bottomLeft,
        child: Icon(Icons.add_a_photo, color:kOrangeColor),
      ),
    );
  }
}
