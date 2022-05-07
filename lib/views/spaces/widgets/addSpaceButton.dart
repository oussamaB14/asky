import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class spaceButton extends StatefulWidget {
  const spaceButton({Key? key}) : super(key: key);

  @override
  State<spaceButton> createState() => _spaceButtonState();
}

class _spaceButtonState extends State<spaceButton> {
  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'addspace');
        },
        child: const Icon(
          CommunityMaterialIcons.plus,
          color: Colors.white,
        ),
        backgroundColor: isDarkTheme ? Color(0xFF2cb67d) : Color(0xFF7f5af0));
  }
}
