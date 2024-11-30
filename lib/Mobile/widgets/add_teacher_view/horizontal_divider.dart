
import 'package:flutter/material.dart';
import 'package:quizapp/responsive_text.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({
    super.key, required this.size,
  });
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 2,width:getResponsiveText(context, size), );
  }
}
