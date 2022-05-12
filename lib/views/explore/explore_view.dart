import 'package:asky/models/tags.dart';
import 'package:asky/views/QuestionViews/widgets/QuestionCard.dart';
import 'package:asky/views/explore/controllers/exploreViewController.dart';

import 'package:asky/views/explore/explore_button.dart';
import 'package:asky/views/tags/tags_view.dart';
import 'package:asky/widgets/in_app_drawer.dart';
import 'package:asky/widgets/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final exploreController =
        Provider.of<ExploreViewController>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.all(8),
          child: TextField(
            //  style: Theme.of(context).textTheme.bodyText2,
            controller: _searchController,
            onChanged: (v) {
              if (v.length > 1) {
                exploreController.searchQuestion(v);
              }
            },
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                label: Text('Search'),
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                    onPressed: () {
                      // TODO DISPOSE TEXT FIELD AND RESET DATA
                      _searchController.clear();
                      exploreController.disposeSearch();
                    },
                    icon: Icon(Icons.close)),
                floatingLabelBehavior: FloatingLabelBehavior.never),
          ),
        ),
      ),
      body: Consumer<ExploreViewController>(builder: (context, app, child) {
        return SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                // filters chips
                _tagsFilterComponent(app),
                // TODO ADD DATA
                Column(
                  children: [
                    if (_searchController.text.isNotEmpty &&
                        app.searchedQuestions.isEmpty)
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(16),
                            child: Image.asset(
                              'assets/images/_Pngtree_no_result_search_icon_6511543-removebg-preview.png',
                              height: 35.h,
                            ),
                          ),
                          const Divider()
                        ],
                      ),
                    Column(
                      children:
                          List.generate(app.getRightList().length, (index) {
                        return QuestionCard(
                            question: app.getRightList()[index]);
                      }),
                    ),
                  ],
                )
              ],
            ));
      }),
    );
  }

  Widget _tagsFilterComponent(app) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(app.filters.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 5),
            child: FilterChip(
                label: Text(
                  app.filters[index],
                  style: TextStyle(
                      color: app.selectedFilters.contains(app.filters[index])
                          ? Colors.white
                          : Colors.black),
                ),
                showCheckmark: true,
                selected: app.selectedFilters.contains(app.filters[index]),
                onSelected: (filter) {
                  app.addFilter(app.filters[index]);
                }),
          );
        }),
      ),
    );
  }
}
