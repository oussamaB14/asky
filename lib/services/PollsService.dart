import 'package:asky/models/Polls.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PollsService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future addQuestion(Polls question) async {
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get()
          .then((value) {
        question.userPhoto = value['imgUrl'];
      });
    } catch (e) {}
    await _db
        .collection('questions')
        .add(question.toDocument())
        .then((value) => print(value));
  }

  Future<List<Polls>> getAllPolls() async {
    List<Polls> polls = [];
    await _db.collection('questions').get().then((value) {
      value.docs.forEach((element) {
        polls.add(Polls.fromDocument(element));
      });
    });
    // print(questions);
    return polls;
  }
}
