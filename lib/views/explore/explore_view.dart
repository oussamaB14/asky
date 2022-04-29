import 'package:asky/models/tags.dart';

import 'package:asky/views/explore/explore_button.dart';
import 'package:asky/views/tags/tags_view.dart';
import 'package:asky/widgets/in_app_drawer.dart';
import 'package:asky/widgets/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../services/tagsService.dart';
import '../QuestionViews/widgets/QuestionButton.dart';
import '../spaces/widgets/ask_card.dart';
import '../spaces/widgets/join_space_card.dart';
import '../spaces/widgets/quize_card.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  TextEditingController _searchController = TextEditingController();
  // final TagsView tag = new TagsView();
  List<TagModel>? selectedtagList = [];
  List<TagModel> tagList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        endDrawer: SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 28.h,
              child: const AppDrawer(),
            ),
          ),
        ),
        floatingActionButton: exploreButton(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                // scrollDirection: Axis.horizontal,
                child: Wrap(children: [
              Text('Explore',
                  style: GoogleFonts.josefinSans(
                      textStyle: Theme.of(context).textTheme.headline2,
                      fontSize: 4.5.h)),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: const [MyQuizCard(), MySpaceCard(), MyAskcard()],
              ),
              SizedBox(height: 2.h,),
              Text('Spaces',
                  style: GoogleFonts.josefinSans(
                      textStyle: Theme.of(context).textTheme.headline3,
                      fontSize: 2.5.h)),
            ]))));
  }
}
