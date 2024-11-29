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
       
        Container(
          color: Colors.black,
          height: 18,
          width: 2,
        ),
        const SizedBox(
          width: 8,
        ) ,Icon(size: 18,
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
