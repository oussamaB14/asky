import 'package:asky/models/Question.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:timeago/timeago.dart' as timeago;

import '../models/user.dart';

class ViewImage extends StatefulWidget {
  final Question question;

  const ViewImage({required this.question});

  @override
  _ViewImageState createState() => _ViewImageState();
}

final DateTime timestamp = DateTime.now();

FirebaseFirestore _db = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
currentUserId() {
  return _auth.currentUser?.uid;
}

late UserModel user;

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildImage(context),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 40.0,
              width: MediaQuery.of(context).size.width,
              child: Row(children: [
                Column(
                  children: [
                    Text(
                      widget.question.username,
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 3.0),
                    // Row(
                    //   children: [
                    //     Icon(Icons.alarm, size: 13.0),
                    //     SizedBox(width: 3.0),
                    //     Text(timeago.format(widget.question.timestamp.toDate())),
                    //   ],
                    // ),
                  ],
                ),
                Spacer(),
                // buildLikeButton(),
              ]),
            ),
          )),
    );
  }

  buildImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: CachedNetworkImage(
          imageUrl: widget.question.mediaUrl,
          placeholder: (context, url) {
            return CircularProgressIndicator();
          },
          errorWidget: (context, url, error) {
            return Icon(Icons.error);
          },
          height: 400.0,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }

  // addLikesToNotification() async {
  //   bool isNotMe = currentUserId() != widget.question.authorId;

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

  // // buildLikeButton() {
  // //   return StreamBuilder(
  // //     stream: likesRef
  // //         .where('postId', isEqualTo: widget.post.postId)
  // //         .where('userId', isEqualTo: currentUserId())
  // //         .snapshots(),
  // //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
  // //       if (snapshot.hasData) {
  // //         List<QueryDocumentSnapshot> docs = snapshot?.data?.docs ?? [];
  // //         return IconButton(
  // //           onPressed: () {
  // //             if (docs.isEmpty) {
  // //               likesRef.add({
  // //                 'userId': currentUserId(),
  // //                 'postId': widget.post.postId,
  // //                 'dateCreated': Timestamp.now(),
  // //               });
  // //               addLikesToNotification();
  // //             } else {
  // //               likesRef.doc(docs[0].id).delete();
  // //               removeLikeFromNotification();
  // //             }
  // //           },
  // //           icon: docs.isEmpty
  // //               ? Icon(
  // //                   CupertinoIcons.heart,
  // //                 )
  // //               : Icon(
  // //                   CupertinoIcons.heart_fill,
  // //                   color: Colors.red,
  // //                 ),
  // //         );
  // //       }
  // //       return Container();
  // //     },
  // //   );
  // }
}
