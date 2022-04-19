import 'package:asky/views/profile/student_profile.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import '../../../services/auth_service.dart';

class SpaceDrawer extends StatelessWidget {
  const SpaceDrawer({Key? key}) : super(key: key);

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
                leading: const Icon(CommunityMaterialIcons.forum),
                selectedTileColor: Colors.blue,
                title: Text("My spaces"),
                onTap: () {
                  Navigator.of(context).pushNamed("MySpaces");
                },
              ),
              ListTile(
                leading: const Icon(CommunityMaterialIcons.forum),
                selectedTileColor: Colors.blue,
                title: Text("Quize"),
                onTap: () {
                  Navigator.of(context).pushNamed("/topics");
                },
              ),
              ListTile(
                leading: const Icon(CommunityMaterialIcons.chart_bubble),
                title: Text("Chat"),
                onTap: () {
                  Navigator.of(context).pushNamed("chatPage");
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text("Leave"),
                onTap: () {
                  Navigator.of(context).pushNamed("Settings");
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}
