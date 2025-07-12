import 'package:flutter/material.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/responsive_text.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({
    super.key,
    required this.size, this.color = kWhite,
  });
  final double size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 2,
      width: getResponsiveText(context, size),
    );
  }
}
