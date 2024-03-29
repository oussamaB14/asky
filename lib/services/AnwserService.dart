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
  void editAnswer(String parentDocId, String id, String answer) async {
    await _db
        .collection('questions')
        .doc(parentDocId)
        .get()
        .then((value) async {
      List<dynamic> answers = value['anwsers'];
      answers.forEach((element) {
        if (element['id'] == id) {
          element['answer'] = answer;
          return;
        }
      });
      await _db.collection('questions').doc(parentDocId).update({
        "anwsers": answers,
      });
    });
  }

//////////////////-------Delete QUESTION-------------////////////////////////////
  Future deleteAnswser(String parentDocId, String id) async {
    await _db
        .collection('questions')
        .doc(parentDocId)
        .get()
        .then((value) async {
      List<dynamic> answers = value['anwsers'];
      for (int i = 0; i < answers.length; i++) {
        if (answers[i]['id'] == id) {
          answers.removeAt(i);
          await _db.collection('questions').doc(parentDocId).update({
            "anwsers": answers,
          });
          return;
        }
      }
    });
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
