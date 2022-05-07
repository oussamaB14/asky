import 'package:asky/services/test.dart';
import 'package:asky/styles/colors.dart';
import 'package:asky/styles/theme.dart';
import 'package:asky/views/explore/explore_view.dart';
import 'package:asky/views/home/home_View.dart';
import 'package:asky/views/profile/profile.dart';
import 'package:asky/views/spaces/spaces.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:community_material_icon/community_material_icon.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  int index = 0;
  final screens = [
    HomePage(),
    Explore(),
    SpacesScreen(),
    StudentProfile(),
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
                CommunityMaterialIcons.home_outline,
                size: 2.5.h,
              ),
              selectedIcon: Icon(
                CommunityMaterialIcons.home,
                size: 2.5.h,
              ),
              label: ''),
          NavigationDestination(
              icon: Icon(
                CommunityMaterialIcons.compass_outline,
                size: 2.5.h,
              ),
              selectedIcon: Icon(
                CommunityMaterialIcons.compass,
                size: 2.5.h,
              ),
              label: ''),
          NavigationDestination(
              icon: Icon(
                CommunityMaterialIcons.forum_outline,
                size: 2.5.h,
              ),
              selectedIcon: Icon(
                CommunityMaterialIcons.forum,
                size: 2.5.h,
              ),
              label: ''),
          NavigationDestination(
              icon: Icon(
                CommunityMaterialIcons.account_outline,
                size: 2.5.h,
              ),
              selectedIcon: Icon(
                CommunityMaterialIcons.account,
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
