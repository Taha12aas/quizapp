import 'package:flutter/material.dart';

class DropdownCheckSubject extends StatefulWidget {
  const DropdownCheckSubject({super.key, required this.items, required this.hint});
   final List<String> items;
  final String hint;

  @override
  State<DropdownCheckSubject> createState() => _DropdownCheckSubjectState();
}

class _DropdownCheckSubjectState extends State<DropdownCheckSubject> {
   String? selectedValue; 

 // القيمة المحددة
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true, // لتفعيل الخلفية
        fillColor: Colors.white, // لون الخلفية
        hintStyle: const TextStyle(color: Colors.black), // لون الهينت
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
      hint:  Text(widget.hint,), // الهينت
      value: selectedValue,
      onChanged: (String? newValue) {},
      items: widget.items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style:
                const TextStyle(color: Colors.black), // لون العنصر عند الاختيار
          ),
        );
      }).toList(),
    );
  }
}
