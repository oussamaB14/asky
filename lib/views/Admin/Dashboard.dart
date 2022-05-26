import 'package:asky/views/Admin/shared/DashboardColors.dart';
import 'package:asky/views/Admin/shared/cards.dart';
import 'package:asky/views/Admin/shared/popupmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdminColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AdminColors.green,
        centerTitle: false,
        title: Text(
          'Dashboard',
          style: GoogleFonts.overpass(
              textStyle: Theme.of(context).textTheme.headline2,
              fontSize: 8.sp,
              color: AdminColors.white),
        ),
        flexibleSpace: const Spacer(),
        actions: const [Dashboardpopup()],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //     width: 40.h,
              //     height: 90.h,
              //     child: Card(
              //       color: AdminColors.black,
              //     )),
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
                  Wrap(
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
                      MyDashboardcard(
                        color: AdminColors.pink,
                        title: 'Users',
                      ),
                      MyDashboardcard(
                        color: AdminColors.pink,
                        title: 'Quizes',
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
