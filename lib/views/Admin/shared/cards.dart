import 'package:asky/models/SpaceM.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'DashboardColors.dart';

class MyDashboardcard extends StatefulWidget {
  const MyDashboardcard({
    Key? key,
    required this.title,
    required this.color,
    required this.icon,
    required this.nbr,
  }) : super(key: key);
  final String title;
  final Color color;
  final Icon icon;
  final int nbr;

  @override
  State<MyDashboardcard> createState() => _MyDashboardcardState();
}

class _MyDashboardcardState extends State<MyDashboardcard> {
  int index = 0;
  // int? nbr;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35.h,
      height: 20.h,
      child: Card(
        color: widget.color,
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.icon,
                Text(
                  widget.title,
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
                  widget.nbr.toString(),
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
