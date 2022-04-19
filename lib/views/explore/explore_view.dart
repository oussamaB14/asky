import 'package:asky/models/tags.dart';
import 'package:asky/views/explore/explore_button.dart';
import 'package:asky/views/tags/tags_view.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';

import '../QuestionViews/widgets/QuestionButton.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  // final TagsView tag = new TagsView();
  List<TagModel>? selectedtagList = [];
  List<TagModel> tagList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("explore"),
      ),
      floatingActionButton: exploreButton(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          // TextButton(
          //   onPressed: _openFilterDialog,
          //   child: Text(
          //     "Filter Dialog",
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   style: ButtonStyle(
          //       backgroundColor: MaterialStateProperty.all(Colors.blue)),
          //   // color: Colors.blue,
          // ),
        ],
      )),
    );
  }
}
