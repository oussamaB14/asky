import 'package:asky/models/Anwser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class AnwserService {
  late UserModel user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  currentUserId() {
    return _auth.currentUser?.uid;
  }

  FirebaseFirestore _db = FirebaseFirestore.instance;

  void addAnswer(Map<String, dynamic> answer, String id) async {
    await FirebaseFirestore.instance
        .collection('questions')
        .doc(id)
        .get()
        .then((value) async {
      List<dynamic> answers = value['anwsers'];
      answers.add(answer);
      await FirebaseFirestore.instance
          .collection('questions')
          .doc(id)
          .update({'anwsers': answers});
    });
  }
  // ADD NEW QUESTION TO DB

//////////////////-------EDIT QUESTION-------------////////////////////////////
  void editAnswer(
    String answer,
  ) async {
    await _db
        .collection('questions')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      "answer": answer,
    });
  }

//////////////////-------Delete QUESTION-------------////////////////////////////
  Future deleteAnswser(String id) async {
    final collection = FirebaseFirestore.instance.collection('questions');
    collection
        .doc(id) // <-- Doc ID to be deleted.
        .delete() // <-- Delete
        .then((_) => print('Deleted'))
        .catchError((error) => print('Delete failed: $error'));
  }

  // Future addAnwser(
  //     Anwser anwser, Anwser userId, String currentUserId, String postId) async {
  //   DocumentSnapshot doc =
  //       await _db.collection('user').doc(currentUserId).get();
  //   user = UserModel.fromDocument(doc.data());
  //   await _db
  //       .doc(postId)
  //       .collection('awnsers')
  //       .add(anwser.toDocument())
  //       .then((value) => print(value));
  // }

  // CollectionReference commentRef = _db.collection('anwsers');
  //  uploadComment(String currentUserId, String awnser, String postId,
  //     String ownerId, String mediaUrl) async {
  //   DocumentSnapshot doc = await usersRef.doc(currentUserId).get();
  //   user = UserModel.fromJson(doc.data());
  //   await commentRef.doc(postId).collection("comments").add({
  //     "username": user.username,
  //     "awnser": awnser,
  //     "userImg": user.photoUrl,
  //     "userId": user.id,
  //   });
  uploadComment(String currentUserId, String comment, String postId,
      String ownerId, String mediaUrl) async {
    DocumentSnapshot doc =
        await _db.collection('user').doc(currentUserId).get();
    user = UserModel.fromDocument(doc.data() as Map<String, dynamic>);
    await _db.collection('awnsers').doc(postId).collection("awnsers").add({
      "username": user.name,
      "comment": comment,
      "userDp": user.photoUrl,
      "userId": user.id,
    });
    // bool isNotMe = ownerId != currentUserId;
    // if (isNotMe) {
    //   addCommentToNotification("comment", comment, user.username, user.id,
    //       postId, mediaUrl, ownerId, user.photoUrl);
    // }
  }

  // Future<List<Anwser>> getAllawnsers() async {
  //   List<Anwser> awnsers = [];
  //   await _db.collection('awnsers').get().then((value) {
  //     value.docs.forEach((element) {
  //       awnsers.add(Anwser.fromDocument(element));
  //     });
  //   });
  //   print(awnsers);
  //   return awnsers;
  // }
}
