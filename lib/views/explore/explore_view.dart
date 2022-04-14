import 'package:flutter/material.dart';

import '../QuestionViews/widgets/QuestionButton.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("explore"),
      ),
      floatingActionButton: questionButton(),
      body: SingleChildScrollView(
          child: Column(
        children: [],
      )),
    );
  }
}
