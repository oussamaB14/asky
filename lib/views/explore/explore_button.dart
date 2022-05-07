import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';

import '../../models/tags.dart';

class exploreButton extends StatefulWidget {
  const exploreButton({Key? key}) : super(key: key);

  @override
  State<exploreButton> createState() => _exploreButtonState();
}

class _exploreButtonState extends State<exploreButton> {
  List<TagModel>? selectedtagList = [];
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: _openFilterDialog,
        child: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF7f5af0));
  }

  void _openFilterDialog() async {
    await FilterListDialog.display<TagModel>(
      context,
      hideSelectedTextCount: true,
      themeData: FilterListThemeData(context),
      headlineText: 'Select tag',
      height: 500,
      listData: tagList,
      selectedListData: selectedtagList,
      choiceChipLabel: (item) => item!.tag,
      validateSelectedItem: (list, val) => list!.contains(val),
      controlButtons: [ContolButtonType.All, ContolButtonType.Reset],
      onItemSearch: (tag, query) {
        /// When search query change in search bar then this method will be called
        ///
        /// Check if items contains query
        return tag.tag.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedtagList = List.from(list!);
        });
        Navigator.pop(context);
      },
      choiceChipBuilder: (context, item, isSelected) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected! ? Color(0xFF7f5af0) : Colors.grey[300]!,
              )),
          child: Text(
            item.tag,
            style: TextStyle(
                color: isSelected ? Color(0xFF7f5af0) : Colors.grey[300]),
          ),
        );
      },
    );
  }
}

final List<TagModel> tagList = [
  TagModel(tag: 'JavaScript'),
  TagModel(tag: 'Python'),
  TagModel(tag: 'Java'),
  TagModel(tag: 'c++'),
  TagModel(tag: 'php'),
  TagModel(tag: 'web design'),
  TagModel(tag: 'web development'),
  TagModel(tag: 'mobile development'),
  TagModel(tag: 'Frontend'),
  TagModel(tag: 'Backend'),
  TagModel(tag: 'Framework'),
  TagModel(tag: 'Big data'),
  TagModel(tag: 'It'),
  TagModel(tag: 'c#'),
  TagModel(tag: 'graphic design'),
  TagModel(tag: 'mathematics'),
  TagModel(tag: 'physicis'),
  TagModel(tag: 'internet security'),
  TagModel(tag: 'android studio'),
  TagModel(tag: 'vs code'),
  TagModel(tag: 'flutter'),
  TagModel(tag: 'angular'),
  TagModel(tag: 'React'),
  TagModel(tag: 'code'),
  TagModel(tag: 'css'),
];
