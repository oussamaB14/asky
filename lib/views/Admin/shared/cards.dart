import 'package:asky/models/SpaceM.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'DashboardColors.dart';

class MyDashboardcard extends StatelessWidget {
  const MyDashboardcard({Key? key, required this.title, required this.color})
      : super(key: key);
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35.h,
      height: 20.h,
      child: Card(
        color: color,
        child: Column(
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.question_answer,
                  color: AdminColors.white,
                  size: 30,
                ),
                Text(
                  title,
                  style: GoogleFonts.overpass(
                      textStyle: Theme.of(context).textTheme.headline2,
                      fontSize: 6.sp,
                      color: AdminColors.white),
                ),
              ],
            ),
            Row(
              children: [
                const Spacer(),
                Text(
                  '10',
                  style: GoogleFonts.overpass(
                      textStyle: Theme.of(context).textTheme.headline2,
                      fontSize: 8.sp,
                      color: AdminColors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
