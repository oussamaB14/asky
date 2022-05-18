import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../styles/colors.dart';

class AddToBookMark extends StatelessWidget {
  final List<String> id;
  const AddToBookMark({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () async {
        await FirebaseFirestore.instance
            .collection('user')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .get()
            .then((value) async {
          List<dynamic> tab = value['Bookmarks'];
          await FirebaseFirestore.instance
              .collection('user')
              .doc((FirebaseAuth.instance.currentUser?.uid))
              .update({
            'Bookmarks': tab.contains(id[0])
                ? FieldValue.arrayRemove(id)
                : FieldValue.arrayUnion(id)
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: tab.contains(id[0])
                  ? const Text("Question removed ..")
                  : const Text(" saved ..")));
        });
      },
      child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('user')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData) {
              return const Icon(Icons.bookmark_outline);
            }

            var data = snapshot.data;
            List<dynamic> tab = data!['Bookmarks'];

            return Icon(
              tab.contains(id[0]) ? Icons.bookmark : Icons.bookmark_outline,
             color: isDarkTheme ? MyColors.green : appColor,
            );
          }),
    );
  }
}
