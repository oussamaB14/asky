import 'package:asky/views/Admin/shared/DashboardColors.dart';
import 'package:asky/views/Admin/shared/popupmenu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class DaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DaAppBar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      backgroundColor: AdminColors.green,
      centerTitle: false,
      title: Text(
        title,
        style: GoogleFonts.overpass(
            textStyle: Theme.of(context).textTheme.headline2,
            fontSize: 8.sp,
            color: AdminColors.white),
      ),
      flexibleSpace: const Spacer(),
      actions: const [Dashboardpopup()],
    );
  }
}
