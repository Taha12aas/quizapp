import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/teacher_profile_view.dart';

class DropdownCheckSubject extends StatefulWidget {
  const DropdownCheckSubject({
    super.key,
    required this.items,
    required this.enabled,
  });
  final List<String> items;
  final bool enabled;

  @override
  State<DropdownCheckSubject> createState() => _DropdownCheckSubjectState();
}

class _DropdownCheckSubjectState extends State<DropdownCheckSubject> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isDense: false, isExpanded: true, // يجعل القائمة ممتدة أفقياً
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
          TeacherProfileView.chekedClass = newValue!;
          selectedValue = newValue;
        });
      },
      items: widget.items.map((String item) {
        return DropdownMenuItem<String>(
          enabled: widget.enabled,
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
