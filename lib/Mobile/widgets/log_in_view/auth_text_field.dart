import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.iconData,
    required this.obscureText,
  });
  final String hintText;
  final IconData iconData;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        prefixIcon: TextFieldIconS(iconData: iconData),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.white),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: kOrangeColor, width: 3),
        ),
      ),
    );
  }
}

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
