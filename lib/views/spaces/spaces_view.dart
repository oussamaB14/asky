import 'package:flutter/material.dart';

import '../QuestionViews/widgets/QuestionButton.dart';

class SpacesView extends StatelessWidget {
  const SpacesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('spaces'),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: questionButton(),
    );
  }
}
