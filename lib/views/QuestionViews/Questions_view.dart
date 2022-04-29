import 'package:asky/models/Anwser.dart';
import 'package:asky/models/Question.dart';
import 'package:asky/models/user.dart';
import 'package:asky/views/AnwserView/Anwsers_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//not in use

import '../../widgets/view_image.dart';

class Questions extends StatefulWidget {
  final Question question;

  const Questions({required this.question});

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final DateTime timestamp = DateTime.now();
  FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  currentUserId() {
    return _auth.currentUser?.uid;
  }

  //UserModel user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (_) => ViewImage(question: widget.question)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildPostHeader(),
            Container(
              height: 320.0,
              width: MediaQuery.of(context).size.width - 18.0,
              // child: cachedNetworkImage(widget.question.mediaUrl),
            ),
            Flexible(
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                title: Text(
                  // ignore: unnecessary_null_comparison
                  widget.question.content == null ? "" : widget.question.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 5.0),
                      StreamBuilder(
                        stream: _db
                            .collection('awnsers')
                            .doc(widget.question.id)
                            .collection("awnsers")
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            QuerySnapshot<Object?>? snap = snapshot.data;
                            List<QueryDocumentSnapshot<Object?>>? docs =
                                snap?.docs;
                            return buildCommentsCount(
                                context, docs?.length ?? 0);
                          } else {
                            return buildCommentsCount(context, 0);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                trailing: Wrap(
                  children: [
                    // buildLikeButton(),
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.chat_bubble,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (_) => Anwsers(question: widget.question),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildCommentsCount(BuildContext context, int count) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.5),
      child: Text(
        '-   $count anwser',
        style: TextStyle(fontSize: 8.5, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildPostHeader() {
    bool isMe = currentUserId() == widget.question.authorId;
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
      // leading: buildUserDp(),
      title: Text(
        widget.question.username,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        widget.question.title,
      ),
      trailing: isMe
          ? IconButton(
              icon: Icon(Icons.plus_one),
              onPressed: () => handleDelete(context),
            )
          : IconButton(
              ///Feature coming soon
              icon: Icon(CupertinoIcons.bookmark, size: 25.0),
              onPressed: () {},
            ),
    );
  }

  // buildUserDp() {
  //   return StreamBuilder(
  //     stream: _db.collection('user').doc(widget.question.authorId).snapshots(),
  //     builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
  //       if (snapshot.hasData) {
  //         UserModel user =
  //             UserModel.fromDocument(snapshot.data!.data() as Map<String, dynamic>);
  //         return GestureDetector(
  //           onTap: () => showProfile(context, profileId: user.id),
  //           child: CircleAvatar(
  //             radius: 25.0,
  //             backgroundImage: NetworkImage(user.photoUrl),
  //           ),
  //         );
  //       }
  //       return Container();
  //     },
  //   );
  // }

  handleDelete(BuildContext parentContext) {
    //shows a simple dialog box
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                  deleteQuestion();
                },
                child: Text('Delete question'),
              ),
              Divider(),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
            ],
          );
        });
  }

//you can only delete your own posts
  deleteQuestion() async {
    _db.collection('questions').doc(widget.question.id).delete();

//delete all the comments associated with that given post
    QuerySnapshot commentSnapshot = await _db
        .collection('awnsers')
        .doc(widget.question.id)
        .collection('awnsers')
        .get();
    commentSnapshot.docs.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

  // showProfile(BuildContext context, {required String profileId}) {
  //   Navigator.push(
  //     context,
  //     CupertinoPageRoute(
  //       builder: (_) => Profile(profileId: profileId),
  //     ),
  //   );
  // }
}
