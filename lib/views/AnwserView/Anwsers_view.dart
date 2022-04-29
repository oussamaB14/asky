import 'package:asky/models/Anwser.dart';
import 'package:asky/models/Question.dart';
import 'package:asky/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:asky/services/AnwserService.dart';

import 'package:timeago/timeago.dart' as timeago;

import '../../services/QuestionsService.dart';
import '../../widgets/Stream_Anwser_Wrapper.dart';

class Anwsers extends StatefulWidget {
  final Question question;

  const Anwsers({required this.question});

  _AnwsersState createState() => _AnwsersState();
}

class _AnwsersState extends State<Anwsers> {
  late UserModel user;

  QuestionsServices services = QuestionsServices();
  AnwserService anwserServices = AnwserService();
  final DateTime timestamp = DateTime.now();
  TextEditingController commentsTEC = TextEditingController();

  FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  currentUserId() {
    return _auth.currentUser?.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.xmark_circle_fill,
          ),
        ),
        centerTitle: true,
        title: Text('awnsers'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Flexible(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: buildFullPost(),
                  ),
                  Divider(thickness: 1.5),
                  Flexible(
                    child: buildComments(),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                constraints: BoxConstraints(
                  maxHeight: 190.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: TextField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: commentsTEC,
                          style: const TextStyle(
                            fontSize: 15.0,
                            color: Colors.blue,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: "Write your comment...",
                            hintStyle: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.blue,
                            ),
                          ),
                          maxLines: null,
                        ),
                        trailing: GestureDetector(
                          onTap: () async {
                            await anwserServices.uploadComment(
                              currentUserId(),
                              commentsTEC.text,
                              widget.question.id,
                              widget.question.authorId,
                              widget.question.mediaUrl,
                            );
                            commentsTEC.clear();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.send,
                              color: Theme.of(context).canvasColor,
                            ),
                          ),
                        ),
                      ),
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

  buildFullPost() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 250.0,
          width: MediaQuery.of(context).size.width - 20.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.question.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [],
                  ),
                ],
              ),
              Spacer(),
              // buildLikeButton(),
            ],
          ),
        ),
      ],
    );
  }

  buildComments() {
    return CommentsStreamWrapper(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      stream: _db
          .collection('awnsers')
          .doc(widget.question.id)
          .collection('awnsers')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, DocumentSnapshot snapshot) {
        Anwser anwsers =
            Anwser.fromJson(snapshot.data() as Map<String, dynamic>);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              leading: CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(anwsers.userImg),
              ),
              title: Text(
                anwsers.username,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              // subtitle: Text(
              //   timeago.format(comments.timestamp.toDate()),
              //   style: TextStyle(fontSize: 12.0),
              // ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                anwsers.awnser,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            Divider()
          ],
        );
      },
    );
  }

  // buildLikeButton() {
  //   return StreamBuilder(
  //     stream: likesRef
  //         .where('postId', isEqualTo: widget.post.postId)
  //         .where('userId', isEqualTo: currentUserId())
  //         .snapshots(),
  //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //       if (snapshot.hasData) {
  //         List<QueryDocumentSnapshot> docs = snapshot?.data?.docs ?? [];
  //         return IconButton(
  //           onPressed: () {
  //             if (docs.isEmpty) {
  //               likesRef.add({
  //                 'userId': currentUserId(),
  //                 'postId': widget.post.postId,
  //                 'dateCreated': Timestamp.now(),
  //               });
  //               addLikesToNotification();
  //             } else {
  //               likesRef.doc(docs[0].id).delete();

  //               removeLikeFromNotification();
  //             }
  //           },
  //           icon: docs.isEmpty
  //               ? Icon(
  //                   CupertinoIcons.heart,
  //                 )
  //               : Icon(
  //                   CupertinoIcons.heart_fill,
  //                   color: Colors.red,
  //                 ),
  //         );
  //       }
  //       return Container();
  //     },
  //   );
  // }

  // buildLikesCount(BuildContext context, int count) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 7.0),
  //     child: Text(
  //       '$count likes',
  //       style: TextStyle(
  //         fontWeight: FontWeight.bold,
  //         fontSize: 10.0,
  //       ),
  //     ),
  //   );
  // }

  // addLikesToNotification() async {
  //   bool isNotMe = currentUserId() != widget.post.ownerId;

  //   if (isNotMe) {
  //     DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
  //     user = UserModel.fromJson(doc.data());
  //     notificationRef
  //         .doc(widget.post.ownerId)
  //         .collection('notifications')
  //         .doc(widget.post.postId)
  //         .set({
  //       "type": "like",
  //       "username": user.username,
  //       "userId": currentUserId(),
  //       "userDp": user.photoUrl,
  //       "postId": widget.post.postId,
  //       "mediaUrl": widget.post.mediaUrl,
  //       "timestamp": timestamp,
  //     });
  //   }
  // }

  // removeLikeFromNotification() async {
  //   bool isNotMe = currentUserId() != widget.post.ownerId;

  //   if (isNotMe) {
  //     DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
  //     user = UserModel.fromJson(doc.data());
  //     notificationRef
  //         .doc(widget.post.ownerId)
  //         .collection('notifications')
  //         .doc(widget.post.postId)
  //         .get()
  //         .then((doc) => {
  //               if (doc.exists) {doc.reference.delete()}
  //             });
  //   }
  // }
}
