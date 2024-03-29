import 'package:asky/constants/assets.dart';
import 'package:asky/views/QuestionViews/EditQuestion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class PollPopMenu extends StatefulWidget {
  final String docId;
  const PollPopMenu({Key? key, required this.docId}) : super(key: key);

  @override
  State<PollPopMenu> createState() => _PollPopMenuState();
}

class _PollPopMenuState extends State<PollPopMenu> {
  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return PopupMenuButton(
        icon: Icon(
          Icons.more_vert,
          color: isDarkTheme ? MyColors.green : appColor,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        onSelected: (int item) => onSelected(context, item),
        itemBuilder: (context) => [
              PopupMenuItem<int>(
                  value: 0,
                  child: ListTile(
                      title: Text(
                        'Delete',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isDarkTheme ? MyColors.green : appColor),
                      ),
                      leading: Icon(
                        Icons.delete,
                        color: isDarkTheme ? MyColors.green : appColor,
                      )))
            ]);
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        FirebaseFirestore.instance
            .collection('polls')
            .doc(widget.docId)
            .delete();
        break;
    }
  }
}
