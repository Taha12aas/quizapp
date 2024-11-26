import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/widgets/home_screen/custome_tile_drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xff373737)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.person, color: Colors.white, size: 40),
                ),
                SizedBox(height: 10),
                Text('طه حوراني',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                Text('0987042775',
                    style: TextStyle(color: Colors.white, fontSize: 13)),
              ],
            ),
          ),
          CustomeTileDrawerItem(
            text: 'الصفحة الرئيسية',
            icon: Icons.home,
          ),
          CustomeTileDrawerItem(
            text: 'إضافة مدرسين',
            icon: Icons.add_circle_outline_sharp,
          ),
          CustomeTileDrawerItem(
            text: 'حذف مدرسين',
            icon: Icons.delete,
          ),
          CustomeTileDrawerItem(
            text: 'About',
            icon: Icons.info_outline,
          ),
        ],
      ),
    );
  }
}
