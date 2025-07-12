import 'package:flutter/material.dart';
import 'package:quizapp/Mobile/views/add_teacher_view.dart';
import 'package:quizapp/Mobile/views/change_phone_admin.dart';
import 'package:quizapp/Mobile/widgets/home_view/DropDownSearch/show_custom_drop_down_delete.dart';
import 'package:quizapp/Mobile/widgets/home_view/custome_tile_drawer_item.dart';
import 'package:quizapp/Mobile/widgets/log_in_view/logo_image.dart';
import 'package:quizapp/utils/constants.dart';

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
      backgroundColor: kAshen,
      child: ListView(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: kAshen),
              child: Center(
                child: SizedBox(width: 200, child: LogoImage()),
              )),
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
            text: 'تغيير رقم الهاتف',
            icon: Icons.phone,
            isSelected: _selectedIndex == 3,
            onTap: () {
              Navigator.pushNamed(context, ChangePhoneAdmin.id);

              _onItemTapped(3);
              Scaffold.of(context).closeDrawer();
            },
          ),
          CustomeTileDrawerItem(
            text: 'تغيير كلمة السر',
            icon: Icons.lock,
            isSelected: _selectedIndex == 4,
            onTap: () {
              _onItemTapped(4);
              Scaffold.of(context).closeDrawer();
            },
          ),
          CustomeTileDrawerItem(
            text: 'About',
            icon: Icons.info_outline,
            isSelected: _selectedIndex == 5,
            onTap: () {
              _onItemTapped(5);
              Scaffold.of(context).closeDrawer();
            },
          ),
        ],
      ),
    );
  }
}
