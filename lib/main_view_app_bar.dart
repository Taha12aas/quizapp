import 'package:flutter/material.dart';

PreferredSizeWidget mainViewAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50), // ارتفاع AppBar
    child: Container(
      decoration: const BoxDecoration(
        color: Color(0xff373737),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      // لون الخلفية
      padding: const EdgeInsets.only(top: 10), // للتعامل مع ارتفاع شريط الحالة
      child: Builder(
        builder: (BuildContext innerContext) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Leading (زر القائمة لفتح Drawer)
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(innerContext).openDrawer(); // فتح Drawer
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
      ),
    ),
  );
}
