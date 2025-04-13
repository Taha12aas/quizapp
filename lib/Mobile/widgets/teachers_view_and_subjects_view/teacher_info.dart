import 'package:flutter/widgets.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class TeacherInfo extends StatelessWidget {
  const TeacherInfo({
    super.key,
    required this.image,
    required this.teacherName, required this.onTap,
  });
  final String image;
  final String teacherName;
  final VoidCallback onTap ;
  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: kAshen, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const Spacer(),
              Text(
                teacherName,
                style: FontStyleApp.orange18.copyWith(
                  fontSize: getResponsiveText(
                    context,
                    18,
                  ),
                ),
              ),
              Text(
                ' : اسم المدرس',
                style: FontStyleApp.white15.copyWith(
                  fontSize: getResponsiveText(
                    context,
                    18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
