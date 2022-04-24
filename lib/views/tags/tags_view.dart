// import 'package:asky/views/tags/filterPage.dart';
// import 'package:flutter/material.dart';
// import 'package:filter_list/filter_list.dart';

// import '../../models/tags.dart';

// class TagsView extends StatefulWidget {
//   const TagsView({Key? key}) : super(key: key);

//   @override
//   State<TagsView> createState() => _TagsViewState();
// }

// class _TagsViewState extends State<TagsView> {
//   List<TagModel>? selectedtagList = [];
//   List<TagModel> tagList = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('widget.title!'),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(bottom: 30),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             TextButton(
//               onPressed: _openFilterDialog,
//               child: Text(
//                 "Filter Dialog",
//                 style: TextStyle(color: Colors.white),
//               ),
//               style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.blue)),
//               // color: Colors.blue,
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: <Widget>[
//           selectedtagList == null || selectedtagList!.length == 0
//               ? Expanded(
//                   child: Center(
//                     child: Text('No user selected'),
//                   ),
//                 )
//               : Expanded(
//                   child: ListView.separated(
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(selectedtagList![index].tag),
//                       );
//                     },
//                     separatorBuilder: (context, index) => Divider(),
//                     itemCount: selectedtagList!.length,
//                   ),
//                 ),
//         ],
//       ),
//     );
//   }

//   void _openFilterDialog() async {
//     await FilterListDialog.display<TagModel>(
//       context,
//       hideSelectedTextCount: true,
//       themeData: FilterListThemeData(context),
//       headlineText: 'Select tag',
//       height: 500,
//       listData: tagList,
//       selectedListData: selectedtagList,
//       choiceChipLabel: (item) => item!.tag,
//       validateSelectedItem: (list, val) => list!.contains(val),
//       controlButtons: [ContolButtonType.All, ContolButtonType.Reset],
//       onItemSearch: (tag, query) {
//         /// When search query change in search bar then this method will be called
//         ///
//         /// Check if items contains query
//         return tag.tag.toLowerCase().contains(query.toLowerCase());
//       },

//       onApplyButtonClick: (list) {
//         setState(() {
//           selectedtagList = List.from(list!);
//         });
//         Navigator.pop(context);
//       },

//       /// uncomment below code to create custom choice chip
//       choiceChipBuilder: (context, item, isSelected) {
//         return Container(
//           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           decoration: BoxDecoration(
//               border: Border.all(
//             color: isSelected! ? Colors.blue[300]! : Colors.grey[300]!,
//           )),
//           child: Text(
//             item.tag,
//             style: TextStyle(
//                 color: isSelected ? Colors.blue[300] : Colors.grey[300]),
//           ),
//         );
//       },
//     );
//   }
// }
