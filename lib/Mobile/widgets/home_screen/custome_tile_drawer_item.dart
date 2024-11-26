import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';

class CustomeTileDrawerItem extends StatelessWidget {
  const CustomeTileDrawerItem({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        autofocus: true,
        focusColor: kOrangeColor,
        onTap: () {},
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                text,
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(icon),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
