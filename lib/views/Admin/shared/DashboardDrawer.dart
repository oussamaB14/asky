import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:ternav_icons/ternav_icons.dart';

import 'DashboardColors.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AdminColors.black,
      child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            SizedBox(height: 2.h),
            Image.asset('assets/images/applogo.png', height: 10.h),
            SizedBox(height: 2.h),
            Text(
              'Asky dashboard menu',
              style: GoogleFonts.overpass(
                  textStyle: Theme.of(context).textTheme.bodySmall,
                  fontSize: 4.sp,
                  color: AdminColors.white),
            ),
            const Divider(),
            dashboardMenu(
                'Dashboard',
                Icon(
                  TernavIcons.lightOutline.home,
                  color: AdminColors.green,
                ),
                "Dahome",
                context),
            dashboardMenu(
                'Questions',
                Icon(
                  TernavIcons.lightOutline.qustion,
                  color: AdminColors.green,
                ),
                "DaQuestion",
                context),
            dashboardMenu(
                'Anwsers',
                Icon(
                  CommunityMaterialIcons.chat_outline,
                  color: AdminColors.green,
                ),
                "DaAnwsers",
                context),
            dashboardMenu(
                'Polls',
                Icon(
                  CommunityMaterialIcons.poll_box_outline,
                  color: AdminColors.green,
                ),
                "DaPolls",
                context),
            dashboardMenu(
                'Spaces',
                Icon(
                  TernavIcons.lightOutline.chat,
                  color: AdminColors.green,
                ),
                "DaSpaces",
                context),
            dashboardMenu(
                'Quizzes',
                Icon(
                  CommunityMaterialIcons.forum_outline,
                  color: AdminColors.green,
                ),
                "DaQuizzes",
                context),
            dashboardMenu(
                'Users',
                Icon(
                  TernavIcons.lightOutline.profile,
                  color: AdminColors.green,
                ),
                "DaUsers",
                context),
            dashboardMenu(
                'Tags',
                Icon(
                  TernavIcons.lightOutline.laptop,
                  color: AdminColors.green,
                ),
                "Datags",
                context),
            dashboardMenu(
                'Settings',
                Icon(
                  TernavIcons.lightOutline.settings,
                  color: AdminColors.green,
                ),
                "DaSettings",
                context),
          ])),
    );
  }
}

ListTile dashboardMenu(String name, Icon icon, String routeName, context) {
  return ListTile(
      title: Text(
        name,
        style: GoogleFonts.overpass(
            // textStyle: Theme.of(context).textTheme.bodySmall,
            fontSize: 4.sp,
            color: AdminColors.white),
      ),
      leading: icon,
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      });
}
