import 'package:cloud_firestore/cloud_firestore.dart';
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

  // List<TagModel> tagList = <TagModel>[];

  // getdata() async {
  //   await FirebaseFirestore.instance
  //       .collection("tags")
  //       .doc('rbG0zyI8gEXsW4B4Xnvi')
  //       .get()
  //       .then((value) {
  //     setState(() {
  //       // first add the data to the Offset object
  //       List.from(value.data['tag').forEach((element) {
  //         TagModel data = new TagModel(element);

  //         //then add the data to the List<Offset>, now we have a type Offset
  //         tagList.add(data);
  //       });
  //     });
  //   });
  // }

  // FirebaseFirestore _db = FirebaseFirestore.instance;
  // Future<List<TagModel>> getTags() async {
  //   List<TagModel> tagList = <TagModel>[];
  //   await _db.collection('tags').get().then((value) {
  //     value.docs.forEach((element) {
  //       tagList.add(TagModel.fromDocument(element));
  //     });
  //   });
  //   print(tagList);
  //   return tagList;
  // }

  // List<TagModel> tagList = <TagModel>[];

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
        return Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected! ? Colors.blue[300]! : Colors.grey[300]!,
                )),
            child: Text(
              item.tag,
              style: TextStyle(
                  color: isSelected ? Colors.blue[300] : Colors.grey[300]),
            ),
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
