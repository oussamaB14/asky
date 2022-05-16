import 'package:asky/views/explore/explore_view.dart';
import 'package:asky/views/home/home_View.dart';
import 'package:asky/views/profile/profile.dart';
import 'package:asky/views/spaces/spaces.dart';

import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

import 'package:sizer/sizer.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int index = 0;
  final screens = [
    const HomePage(),
    const Explore(),
    const SpacesScreen(),
    const StudentProfile(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBar(
        // type: BottomNavigationBarType.fixed,
        // selectedItemColor: Color(0xFF7f5af0),
        // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        // currentIndex: index,
        height: 60,
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() {
          this.index = index;
        }),
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        // unselectedItemColor: Theme.of(context).dividerColor,
        destinations: [
          NavigationDestination(
              icon: Icon(
                Iconsax.home,
                size: 2.5.h,
              ),
              selectedIcon: Icon(
                Iconsax.home1,
                size: 2.5.h,
              ),
              label: ''),
          NavigationDestination(
              icon: Icon(
                Iconsax.search_normal_1,
                size: 2.5.h,
              ),
              selectedIcon: Icon(
                Iconsax.search_normal_1,
                size: 2.5.h,
              ),
              label: ''),
          NavigationDestination(
              icon: Icon(
                Iconsax.favorite_chart,
                size: 2.5.h,
              ),
              selectedIcon: Icon(
                Iconsax.frame_5,
                size: 2.5.h,
              ),
              label: ''),
          NavigationDestination(
              icon: Icon(
                Iconsax.user,
                size: 2.5.h,
              ),
              selectedIcon: Icon(
                Iconsax.user,
                size: 2.5.h,
              ),
              label: ''),
        ],
        // onTap: (index) => setState(() {
        //   this.index = index;
        // }),
      ),
    );
  }
}
