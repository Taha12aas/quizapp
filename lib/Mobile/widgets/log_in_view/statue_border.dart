import 'package:flutter/material.dart';

OutlineInputBorder statueBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(color: color, width: 3),
    );
  }