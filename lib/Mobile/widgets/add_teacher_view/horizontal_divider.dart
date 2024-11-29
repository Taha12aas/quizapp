
import 'package:flutter/material.dart';
import 'package:quizapp/responsive_text.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 2,width:getResponsiveText(context, 44),                );
  }
}
