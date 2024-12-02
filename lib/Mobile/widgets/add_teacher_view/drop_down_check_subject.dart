import 'package:flutter/material.dart';

class DropdownCheckSubject extends StatefulWidget {
  const DropdownCheckSubject({
    super.key,
    required this.items,
  });
  final List<String> items;

  @override
  State<DropdownCheckSubject> createState() => _DropdownCheckSubjectState();
}

class _DropdownCheckSubjectState extends State<DropdownCheckSubject> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true, // يجعل القائمة ممتدة أفقياً
      decoration: InputDecoration(
        filled: true, // تفعيل الخلفية
        fillColor: Colors.white, // لون الخلفية
        hintStyle: const TextStyle(color: Colors.black),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0), // حدود دائرية
          borderSide:
              const BorderSide(color: Colors.orange, width: 2.0), // لون الإطار
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: Colors.orange, width: 2.0),
        ),
      ),
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
      },
      items: widget.items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Align(
            alignment: Alignment.centerRight, // محاذاة العنصر لليمين
            child: Text(
              item,
              textAlign: TextAlign.right,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      }).toList(),
    );
  }
}
