import 'package:asky/views/Admin/shared/DaAppBar.dart';
import 'package:asky/views/Admin/shared/DashboardColors.dart';
import 'package:asky/views/Admin/shared/cards.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../DaAppBar.dart';
import '../DashboardColors.dart';
import '../DashboardDrawer.dart';

class DaHome extends StatelessWidget {
  const DaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdminColors.backgroundColor,
      appBar: const DaAppBar(
        title: 'Dashboard',
      ),
      drawer: const DashboardDrawer(),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Admin\nWelcome to your dashboard',
                  style: GoogleFonts.overpass(
                      textStyle: Theme.of(context).textTheme.headline2,
                      fontSize: 5.sp,
                      color: AdminColors.white),
                ),
                Row(
                  children: [
                    MyDashboardcard(
                      color: AdminColors.green,
                      title: 'Questions',
                      icon: Icon(
                        TernavIcons.lightOutline.qustion,
                        color: AdminColors.white,
                        size: 30,
                      ),
                    ),
                    MyDashboardcard(
                      color: AdminColors.yellow,
                      title: 'Polls',
                      icon: Icon(
                        CommunityMaterialIcons.poll_box_outline,
                        color: AdminColors.white,
                        size: 30,
                      ),
                    ),
                    MyDashboardcard(
                      color: AdminColors.purple,
                      title: 'Anwsers',
                      icon: Icon(
                        CommunityMaterialIcons.chat_outline,
                        color: AdminColors.white,
                        size: 30,
                      ),
                    ),
                    MyDashboardcard(
                      color: AdminColors.pink,
                      title: 'Spaces',
                      icon: Icon(
                        TernavIcons.lightOutline.chat,
                        color: AdminColors.white,
                        size: 30,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
