import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/add_teacher_view.dart';
import 'package:quizapp/Mobile/widgets/home_view/DropDownSearch/show_custom_drop_down_delete.dart';
import 'package:quizapp/Mobile/widgets/home_view/custome_tile_drawer_item.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/responsive_text.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: kAshen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.person, color: Colors.white, size: 40),
                ),
                const SizedBox(height: 10),
                Text(
                  'طه حوراني',
                  style: TextStyle(
                    color: kWhite,
                    fontSize: getResponsiveText(
                      context,
                      18,
                    ),
                  ),
                ),
                Text(
                  '0987042775',
                  style: TextStyle(
                    color: kWhite,
                    fontSize: getResponsiveText(
                      context,
                      13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomeTileDrawerItem(
            text: 'الصفحة الرئيسية',
            icon: Icons.home,
            isSelected: _selectedIndex == 0,
            onTap: () {
              _onItemTapped(0);
              Navigator.pop(context);
            },
          ),
          CustomeTileDrawerItem(
            text: 'إضافة مدرسين',
            icon: Icons.add_circle_outline_sharp,
            isSelected: _selectedIndex == 1,
            onTap: () {
              _onItemTapped(1);
              Navigator.pushNamed(context, AddTeacherView.id);
              Scaffold.of(context).closeDrawer();
            },
          ),
          CustomeTileDrawerItem(
            text: 'حذف مدرسين',
            icon: Icons.delete,
            isSelected: _selectedIndex == 2,
            onTap: () {
              _onItemTapped(2);
              Scaffold.of(context).closeDrawer();
              showCustomDropDownDelete(context);
            },
          ),
          CustomeTileDrawerItem(
            text: 'About',
            icon: Icons.info_outline,
            isSelected: _selectedIndex == 3,
            onTap: () {
              _onItemTapped(3);
              Scaffold.of(context).closeDrawer();
            },
          ),
        ],
      ),
    );
  }
}
