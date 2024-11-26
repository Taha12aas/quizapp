import 'package:flutter/material.dart';

class CustomeTileDrawerItem extends StatelessWidget {
  const CustomeTileDrawerItem({
    super.key,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        focusColor: Colors.orange,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.orange.withOpacity(0.1)
                : const Color.fromARGB(0, 0, 0, 0),
            borderRadius: BorderRadius.circular(8),
          ),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: isSelected
                      ? Colors.orange
                      : Colors.black, 
                ),
              ),
              const SizedBox(width: 10),
              Icon(
                icon,
                color: isSelected
                    ? Colors.orange
                    : Colors.black, 
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
