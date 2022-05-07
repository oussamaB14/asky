import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

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
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, 'addPost');
      },
      child: const Icon(
        CommunityMaterialIcons.plus,
        color: Colors.white,
      ),
      backgroundColor: isDarkTheme ? Color(0xFF2cb67d) : Color(0xFF7f5af0),
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