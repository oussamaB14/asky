import 'package:asky/services/test.dart';
import 'package:asky/styles/colors.dart';
import 'package:asky/styles/theme.dart';
import 'package:asky/views/explore/explore_view.dart';
import 'package:asky/views/home/home_View.dart';
import 'package:asky/views/profile/student_profile.dart';
import 'package:asky/views/spaces/spaces_view.dart';
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
    SpacesView(),
    StudentProfile(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: index,
        unselectedItemColor: Theme.of(context).dividerColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CommunityMaterialIcons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(CommunityMaterialIcons.compass), label: 'explore'),
          BottomNavigationBarItem(
              icon: Icon(CommunityMaterialIcons.forum), label: 'spaces'),
          BottomNavigationBarItem(
              icon: Icon(CommunityMaterialIcons.account), label: 'profile'),
        ],
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
