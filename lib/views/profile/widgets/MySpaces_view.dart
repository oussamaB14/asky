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

                return StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('user')
                        .doc(FirebaseAuth.instance.currentUser?.uid)
                        .snapshots(),
                    builder: ((context, snap) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (!snap.hasData) {
                        return const Text('no bookmarks saved yet');
                      }
                      List<dynamic> spaces = snap.data?['Spaces'];

                      return StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('space')
                              .snapshots(),
                          builder: (context, snap2) {
                            if (snap2.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            if (!snap2.hasData) {
                              return const Text('no bookmarks saved yet');
                            }
                            var docs = snap2.data?.docs;
                            List<dynamic> finalSpaces = [];
                            docs!.forEach((element) {
                              if (spaces.contains(element['spaceName'])) {
                                finalSpaces.add(element);
                              }
                            });
                            return Container(
                              width: 95.h,
                              height: 90.h,
                              child: GridView.count(
                                padding: const EdgeInsets.all(20),
                                crossAxisSpacing: 10,
                                crossAxisCount: 2,
                                children:
                                    List.generate(finalSpaces.length, (index) {
                                  return SpaceCard(
                                      space: Space(
                                          id: '',
                                          spaceName: finalSpaces[index]
                                              ['spaceName'],
                                          description: finalSpaces[index]
                                              ['description'],
                                          spacePhoto: finalSpaces[index]
                                              ['spacePhoto'],
                                          tags: []));
                                }), /*spaces
                                    .map((space) => SpaceCard(space: space))
                                    .toList(),*/
                              ),
                            );
                          });
                    }));
              }
            },
          ),
        ));
  }
}
