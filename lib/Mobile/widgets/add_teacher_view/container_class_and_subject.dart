import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:quizapp/utils/responsive_text.dart';

class ContainerClassAndSubject extends StatelessWidget {
  const ContainerClassAndSubject({
    super.key,
    required this.classs,
    required this.subject,
    this.color,
  });
  final String classs;
  final String subject;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(
            flex: 4,
          ),
          Text(
            subject,
            style: TextStyle(
                fontSize: getResponsiveText(context, 15), color: Colors.black),
          ),
          const Spacer(),
          Text(
            classs,
            style: TextStyle(
                fontSize: getResponsiveText(context, 15), color: Colors.black),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.circleMinus,
              size: getResponsiveText(context, 18),
            ),
          ),
        ],
      ),
    );
  }
}
