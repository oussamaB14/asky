import 'package:asky/views/spaces/widgets/space_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MySpaces extends StatefulWidget {
  const MySpaces({Key? key}) : super(key: key);

  @override
  State<MySpaces> createState() => _MySpacesState();
}

class _MySpacesState extends State<MySpaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Spaces"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          //  SpaceCard(space: 'math',)
        ],
      )),
    );
  }
}
