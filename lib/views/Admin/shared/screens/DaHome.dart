import 'package:asky/views/Admin/shared/DaAppBar.dart';
import 'package:asky/views/Admin/shared/DashboardColors.dart';
import 'package:asky/views/Admin/shared/cards.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

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
                  'Hello, User\nWelcome to your dashboard',
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
                    ),
                    MyDashboardcard(
                      color: AdminColors.yellow,
                      title: 'Polls',
                    ),
                    MyDashboardcard(
                      color: AdminColors.purple,
                      title: 'Anwsers',
                    ),
                    MyDashboardcard(
                      color: AdminColors.pink,
                      title: 'Spaces',
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
