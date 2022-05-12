import 'package:asky/models/SpaceM.dart';
import 'package:asky/views/spaces/widgets/space_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MySpaces extends StatefulWidget {
  const MySpaces({Key? key}) : super(key: key);

  @override
  State<MySpaces> createState() => _MySpacesState();
}

class _MySpacesState extends State<MySpaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Spaces"),
        ),
        body: SingleChildScrollView(
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('user')
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (!snapshot.hasData) {
                return const Text('no bookmarks saved yet');
              } else {
                List<dynamic> books = snapshot.data!['Spaces'];

                return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('space')
                        .snapshots(),
                    builder: ((context, snap) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (!snap.hasData) {
                        return const Text('no bookmarks saved yet');
                      }
                      var data2 = snap.data?.docs;

                      return Column(
                        children: [
                          if (data2 != null)
                            for (int i = 0; i < data2.length; i++)
                              if (books.contains(data2[i].id))
                                SpaceCard(
                                  space: Space(
                                      spaceName: data2[i]['spaceName'],
                                      description: data2[i]['description'],
                                      spacePhoto: data2[i]['spacePhoto'],
                                      id: data2[i].id,
                                      tags: data2[i]['tags']),
                                )
                        ],
                      );
                    }));
              }
            },
          ),
        ));
  }
}
