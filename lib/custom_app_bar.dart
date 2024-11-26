import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar()
      : preferredSize = const Size.fromHeight(50), // ارتفاع AppBar
        super();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff373737), // لون الخلفية
      padding: const EdgeInsets.only(top: 20), // للتعامل مع ارتفاع شريط الحالة
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Leading (زر القائمة)
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // يمكنك إضافة إجراء هنا
            },
          ),

          // Title (الأيقونة في المنتصف)
          const Expanded(
            child: Center(
              child: Icon(
                Icons.school,
                color: Colors.orange,
                size: 30,
              ),
            ),
          ),

          // Actions (زر البحث)
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // إجراء البحث
            },
          ),
        ],
      ),
    );
  }
}
