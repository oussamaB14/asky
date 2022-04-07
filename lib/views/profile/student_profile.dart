import 'package:asky/services/auth_service.dart';
import 'package:asky/views/authentification/signin_view.dart';
import 'package:asky/styles/colors.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sizer/sizer.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  State<StudentProfile> createState() => StudentProfileViewState();
}

class StudentProfileViewState extends State<StudentProfile> {
  get drawer => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('profile'),
        ),
        endDrawer: SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.all(15),
              height: 40.h,
              child: Drawer(
                elevation: 500,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(28),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: DrawerHeader(
                          decoration: BoxDecoration(),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.brown.shade800,
                                child: const Text('AH'),
                              ),
                              Text("user name"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView(children: [
                        ListTile(
                          leading: const Icon(CommunityMaterialIcons.bookmark),
                          title: Text("Bookmarks"),
                          selectedTileColor: Colors.blue,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          leading:
                              const Icon(CommunityMaterialIcons.account_edit),
                          title: Text("Edit profile"),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.settings),
                          title: Text("Settings"),
                          onTap: () async {
                            AuthService().signOut(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(CommunityMaterialIcons.logout),
                          selectedTileColor: Colors.blue,
                          title: Text("Logout"),
                          onTap: () async {
                            AuthService().signOut(context);
                          },
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [],
        ));
  }
}
