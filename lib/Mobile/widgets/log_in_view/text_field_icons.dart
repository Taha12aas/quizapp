import 'package:flutter/material.dart';

class TextFieldIcons extends StatelessWidget {
  const TextFieldIcons({
    super.key,
    required this.iconData,
  });

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: 10,
        ),
        Icon(
          iconData,
          color: Colors.black,
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
