import 'package:flutter/material.dart';

class DropdownCheckSubject extends StatefulWidget {
  const DropdownCheckSubject({
    super.key,
    required this.items,
    required this.enabled,
    this.onChanged,
    this.selectedValue,
  });

  final List<String> items;
  final bool enabled;
  final void Function(String?)? onChanged;
  final String? selectedValue;

  @override
  State<DropdownCheckSubject> createState() => _DropdownCheckSubjectState();
}

class _DropdownCheckSubjectState extends State<DropdownCheckSubject> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isDense: false,
      isExpanded: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintStyle: const TextStyle(color: Colors.black),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: Colors.orange, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: Colors.orange, width: 2.0),
        ),
      ),
      value: widget.selectedValue,
      onChanged: widget.enabled ? widget.onChanged : null,
      items: widget.items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Align(
            alignment: Alignment.centerRight,
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
