import 'package:asky/models/tags.dart';
import 'package:asky/views/QuestionViews/widgets/QuestionCard.dart';
import 'package:asky/views/explore/controllers/exploreViewController.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  TextEditingController _searchController = TextEditingController();
  // final TagsView tag = new TagsView();
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
