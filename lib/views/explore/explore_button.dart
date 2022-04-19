import 'package:community_material_icon/community_material_icon.dart';
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
  List<TagModel> tagList = [];

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _openFilterDialog,
      child: const Icon(
        Icons.search,
        color: Colors.white,
      ),
      backgroundColor: Colors.blue,
    );
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
      choiceChipLabel: (item) => item!.title,
      validateSelectedItem: (list, val) => list!.contains(val),
      controlButtons: [ContolButtonType.All, ContolButtonType.Reset],
      onItemSearch: (tag, query) {
        /// When search query change in search bar then this method will be called
        ///
        /// Check if items contains query
        return tag.title.toLowerCase().contains(query.toLowerCase());
      },

      onApplyButtonClick: (list) {
        setState(() {
          selectedtagList = List.from(list!);
        });
        Navigator.pop(context);
      },

      /// uncomment below code to create custom choice chip
      choiceChipBuilder: (context, item, isSelected) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(
            color: isSelected! ? Colors.blue[300]! : Colors.grey[300]!,
          )),
          child: Text(
            item.title,
            style: TextStyle(
                color: isSelected ? Colors.blue[300] : Colors.grey[300]),
          ),
        );
      },
    );
  }
}
