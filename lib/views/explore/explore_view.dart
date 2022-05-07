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

import '../../models/SpaceM.dart';
import '../../services/SpaceService.dart';
import '../../services/tagsService.dart';
import '../../widgets/Explore_space.dart';
import '../QuestionViews/widgets/QuestionButton.dart';
import '../../widgets/ask_card.dart';
import '../../widgets/join_space_card.dart';
import '../../widgets/quize_card.dart';
import '../Quizzes/error.dart';
import '../spaces/widgets/space_card.dart';

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
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
        backgroundColor:
            isDarkTheme ? Colors.black : Theme.of(context).cardColor,
        appBar: AppBar(),
        endDrawer: SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 27.h,
              child: const AppDrawer(),
            ),
          ),
        ),
        floatingActionButton: const exploreButton(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              // scrollDirection: Axis.horizontal,
              child: Wrap(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Explore',
                        style: GoogleFonts.josefinSans(
                            textStyle: Theme.of(context).textTheme.headline2,
                            fontSize: 4.5.h)),
                    SizedBox(height: 2.h),
                    Text('Quick start',
                        style: GoogleFonts.josefinSans(
                            textStyle: Theme.of(context).textTheme.headline3,
                            fontSize: 2.5.h)),
                  ],
                ),
                Row(
                  children: [
                    MyQuizCard(),
                    const MySpaceCard(),
                    const MyAskcard()
                  ],
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Text('Spaces',
                    style: GoogleFonts.josefinSans(
                        textStyle: Theme.of(context).textTheme.headline3,
                        fontSize: 2.5.h)),
                Spacer(),
                // FutureBuilder<List<Space>>(
                //   future: SpaceService().getSingleSpace(),
                //   builder: (context, snapshot) {
                //     if (snapshot.connectionState == ConnectionState.waiting) {
                //       return const MainLoadingScreen();
                //     } else if (snapshot.hasError) {
                //       return ErrorMessage(message: snapshot.error.toString());
                //     } else if (snapshot.hasData) {
                //       var spaces = snapshot.data!;
                //       return Column(
                //         // primary: false,
                //         // padding: const EdgeInsets.all(20),
                //         // crossAxisSpacing: 10,
                //         // crossAxisCount: 1,
                //         children: spaces
                //             .map((space) => ExploreSpaceCaerd(space: space))
                //             .toList(),
                //       );
                //     } else {
                //       return const Text(
                //           'No topics found in Firestore. Check database');
                //     }
                //   },
                // )
                // ignore: prefer_const_constructors
              ]),
            )));
  }
}
