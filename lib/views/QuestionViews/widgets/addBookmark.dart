import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class AddToBookMark extends StatefulWidget {
  const AddToBookMark({Key? key}) : super(key: key);

  @override
  State<AddToBookMark> createState() => _AddToBookMarkState();
}

class _AddToBookMarkState extends State<AddToBookMark> {
  bool saved = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          saved = !saved;
        });
      },
      child: Icon(
        saved ? Icons.bookmark : Icons.bookmark_outline,
        color: const Color(0xFF7f5af0),
      ),
    );
  }
}
