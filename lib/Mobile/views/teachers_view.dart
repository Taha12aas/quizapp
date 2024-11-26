import 'package:flutter/material.dart';

class TeachersView extends StatelessWidget {
  const TeachersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [Text('تصنيف حسب الصفوف ')],
      ),
    );
  }
}
