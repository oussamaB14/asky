import 'package:asky/views/profile/profile.dart';
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
                leading: const Icon(CommunityMaterialIcons.forum_outline),
                selectedTileColor: Colors.blue,
                title: const Text("My spaces"),
                onTap: () {
                  Navigator.of(context).pushNamed("MySpaces");
                },
              ),
              ListTile(
                leading: const Icon(CommunityMaterialIcons.comment_multiple_outline),
                selectedTileColor: Colors.blue,
                title: const Text("Quiz"),
                onTap: () {
                  Navigator.of(context).pushNamed("/topics");
                },
              ),
              ListTile(
                leading: const Icon(CommunityMaterialIcons.chat_outline),
                title: const Text("Chat"),
                onTap: () {
                  Navigator.of(context).pushNamed("chatPage");
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text("Leave"),
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
