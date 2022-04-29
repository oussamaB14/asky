import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
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
          Expanded(
            flex: 2,
            child: ListView(children: [
              ListTile(
                leading: const Icon(CommunityMaterialIcons.bookmark_outline),
                title: Text("Bookmarks"),
                selectedTileColor: Colors.blue,
                onTap: () {
                  Navigator.of(context).pushNamed("Bookmarks");
                },
              ),
              ListTile(
                leading: const Icon(CommunityMaterialIcons.forum),
                selectedTileColor: Colors.blue,
                title: Text("My spaces"),
                onTap: () {
                  Navigator.of(context).pushNamed("MySpaces");
                },
              ),
              ListTile(
                leading: const Icon(CommunityMaterialIcons.forum_outline),
                selectedTileColor: Colors.blue,
                title: Text("Quize"),
                onTap: () {
                  Navigator.of(context).pushNamed("/topics");
                },
              ),

              ListTile(
                leading: const Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {
                  Navigator.of(context).pushNamed("Settings");
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text("Chat"),
                onTap: () {
                  Navigator.of(context).pushNamed("chatPage");
                },
              ),
              // ListTile(
              //   leading: const Icon(CommunityMaterialIcons.logout),
              //   selectedTileColor: Colors.blue,
              //   title: Text("Logout"),
              //   onTap: () async {
              //     AuthService().signOut(context);
              //   },
              // ),
            ]),
          )
        ],
      ),
    );
  }
}
