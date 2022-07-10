import 'package:asky/views/profile/profile.dart';
import 'package:asky/views/profile/widgets/EditProfile_view.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/auth_service.dart';

class PofileDrawer extends StatelessWidget {
  const PofileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 500,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(28),
        ),
      ),
      child: Column(
        children: [
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     width: MediaQuery.of(context).size.width * 0.85,
          //     child: DrawerHeader(
          //       decoration: BoxDecoration(),
          //       child: Column(
          //         children: [
          //           CircleAvatar(
          //             backgroundColor: Colors.brown.shade800,
          //             child: const Text('AH'),
          //           ),
          //           Text('username.value.text',
          //               style: TextStyle(color: Colors.black)),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            flex: 2,
            child: ListView(children: [
              ListTile(
                leading: const Icon(CommunityMaterialIcons.bookmark_outline),
                title: const Text("Bookmarks"),
                selectedTileColor: Colors.blue,
                onTap: () {
                  Navigator.of(context).pushNamed("Bookmarks");
                },
              ),
              ListTile(
                leading: const Icon(CommunityMaterialIcons.forum),
                selectedTileColor: Colors.blue,
                title: const Text("My spaces"),
                onTap: () {
                  Navigator.of(context).pushNamed("MySpaces");
                },
              ),
              ListTile(
                leading: const Icon(CommunityMaterialIcons.forum_outline),
                selectedTileColor: Colors.blue,
                title: const Text("Quize"),
                onTap: () {
                  Navigator.of(context).pushNamed("/topics");
                },
              ),
              ListTile(
                leading: const Icon(CommunityMaterialIcons.account_edit),
                title: const Text("Edit profile"),
                onTap: () {
                  Provider.of<UserProfileInfoProvider>(context, listen: false)
                      .resetValues();
                  Navigator.of(context).pushNamed("EditProfile");
                },
              ),
              // ListTile(
              //   leading: const Icon(Icons.settings),
              //   title: const Text("Settings"),
              //   onTap: () {
              //     Navigator.of(context).pushNamed("Settings");
              //   },
              // ),
              ListTile(
                leading: const Icon(CommunityMaterialIcons.logout),
                selectedTileColor: Colors.blue,
                title: const Text("Log out"),
                onTap: () async {
                  AuthService().signOut(context);
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}
