import 'package:asky/models/tags.dart';
import 'package:asky/services/tagsService.dart';
import 'package:asky/views/explore/explore_button.dart';
import 'package:asky/views/tags/tags_view.dart';
import 'package:asky/widgets/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../QuestionViews/widgets/QuestionButton.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<TagModel>> getTags() async {
    List<TagModel> tagList = <TagModel>[];
    await _db.collection('tags').get().then((value) {
      value.docs.forEach((element) {
        tagList.add(TagModel.fromDocument(element));
      });
    });
    print(tagList);
    return tagList;
  }

  TextEditingController _searchController = TextEditingController();
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
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                // scrollDirection: Axis.horizontal,
                child: Column(children: [
              FutureBuilder(
                  future: getTags(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(
                          child: MainLoadingScreen(),
                        );
                      case ConnectionState.done:
                        return Column();
                      default:
                        return Text("Error");
                    }
                  })
            ]))));
  }
}
