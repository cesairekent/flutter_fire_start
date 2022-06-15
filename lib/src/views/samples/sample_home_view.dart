import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:hexcolor/hexcolor.dart';

class SampleHomeView extends StatefulWidget {
  const SampleHomeView({Key? key}) : super(key: key);

  @override
  State<SampleHomeView> createState() => _SampleHomeViewState();
}

class _SampleHomeViewState extends State<SampleHomeView> {
  List<BottomNavigationBarItem> navItems = [
    const BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(
        Icons.home,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Lists',
      icon: Icon(
        Icons.list,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Settings',
      icon: Icon(
        Icons.settings,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: const Center(
        child: Text('Home View'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: navItems,
        selectedItemColor: HexColor(
          AppColors.primary,
        ),
        unselectedItemColor: HexColor(AppColors.darkGray,),
        selectedIconTheme: IconThemeData(color: HexColor(AppColors.primary,),),
        unselectedIconTheme: IconThemeData(color: HexColor(AppColors.darkGray,),),
      ),
    );
  }
}
