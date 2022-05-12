import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../polls/addPoll.dart';

class questionButton extends StatefulWidget {
  const questionButton({Key? key}) : super(key: key);

  @override
  State<questionButton> createState() => _questionButtonState();
}

class _questionButtonState extends State<questionButton> {
  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(color: Colors.white),
      backgroundColor:
          isDarkTheme ? const Color(0xFF2cb67d) : const Color(0xFF7f5af0),
      children: [
        SpeedDialChild(
            child: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            label: 'Ask a question',
            backgroundColor: Colors.blue,
            onTap: () {
              Navigator.of(context).pushNamed('addPost');
            }),
        SpeedDialChild(
            child: const Icon(
              CommunityMaterialIcons.poll,
              color: Colors.white,
            ),
            label: 'Add a poll',
            backgroundColor: Colors.blue,
            onTap: () {
              Navigator.of(context).pushNamed('addPoll');
            })
      ],
      // onPressed: () {
      //   Navigator.pushNamed(context, 'addPost');
      // },
      // child: const Icon(
      //   CommunityMaterialIcons.plus,
      //   color: Colors.white,
      // ),
    );
  }
}
// FloatingActionButton(
//           onPressed: () {
//             Navigator.pushNamed(context, 'addPost');
//           },
//           child: const Icon(Icons.add),
//           backgroundColor: Colors.blue,
//         ),