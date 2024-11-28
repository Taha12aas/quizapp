import 'package:flutter/material.dart';

PreferredSizeWidget mainViewAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(55),
    child: Container(
      decoration: const BoxDecoration(
        color: Color(0xff373737),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
      child: Builder(
        builder: (BuildContext innerContext) => Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Keep buttons on the edges
          crossAxisAlignment:
              CrossAxisAlignment.end, // Align items to the bottom
          children: [
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(innerContext).openDrawer();
              },
            ),
            const Align(
              alignment: Alignment.bottomCenter, // Align the icon at the bottom
              child: Icon(
                Icons.school,
                color: Colors.orange,
                size: 50,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    ),
  );
}
