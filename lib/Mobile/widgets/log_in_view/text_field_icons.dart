import 'package:flutter/material.dart';

class TextFieldIconS extends StatelessWidget {
  const TextFieldIconS({
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
        Container(
          color: Colors.black,
          height: 25,
          width: 2,
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
