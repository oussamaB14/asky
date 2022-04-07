import 'package:flutter/material.dart';

import '../QuestionViews/widgets/QuestionButton.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('explore'),
        // automaticallyImplyLeading: false,
      ),
       floatingActionButton: questionButton(),
    );
  }
}
