import 'package:flutter/material.dart';
import 'package:quizapp/utils/constants.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage(klogo),
      fit: BoxFit.contain,
      height: MediaQuery.sizeOf(context).height * .25,
    );
  }
}
