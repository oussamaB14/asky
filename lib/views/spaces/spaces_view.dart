import 'package:asky/views/spaces/widgets/SpaceDrawer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
      endDrawer: SafeArea(
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: EdgeInsets.all(15),
            height: 25.h,
            child: SpaceDrawer(),
          ),
        ),
      ),
      floatingActionButton: questionButton(),
    );
  }
}
