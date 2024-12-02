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
      margin: EdgeInsets.zero,
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.001,
          left: MediaQuery.of(context).size.width * 0.070),
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            subject,
            style: TextStyle(
                fontSize: getResponsiveText(context, 18), color: Colors.black),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.08,
          ),
          Text(
            classs,
            style: TextStyle(
                fontSize: getResponsiveText(context, 18), color: Colors.black),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.075,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.circleMinus,
              size: getResponsiveText(context, 12),
            ),
          ),
        ],
      ),
    );
  }
}
