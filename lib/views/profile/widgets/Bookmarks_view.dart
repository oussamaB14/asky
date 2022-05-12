import 'package:asky/models/Question.dart';
import 'package:asky/views/QuestionViews/widgets/QuestionCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Bookmarks')),
      body: StreamBuilder<DocumentSnapshot>(
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
            List<dynamic> books = snapshot.data!['Bookmarks'];

            return SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('questions')
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
                              QuestionCard(
                                question: Question(
                                    username: data2[i]['username'],
                                    userPhoto: data2[i]['userPhoto'],
                                    title: data2[i]['title'],
                                    content: data2[i]['content'],
                                    authorId: data2[i]['authorId'],
                                    id: data2[i].id,
                                    mediaUrl: data2[i]['mediaUrl']),
                              )
                      ],
                    );
                  })),
            );
          }
        },
      ),
    );
  }
}
