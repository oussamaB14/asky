import 'package:asky/models/Question.dart';
import 'package:asky/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class QuestionsServices {
  String postId = const Uuid().v4();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  // ADD NEW QUESTION TO DB
  Future addQuestion(Question question) async {
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

  Future<List<Question>> getAllQuestions() async {
    List<Question> questions = [];
    await _db.collection('questions').get().then((value) {
      value.docs.forEach((element) {
        questions.add(Question.fromDocument(element));
      });
    });

    return questions;
  }

  Future editQuestion(Question question) async {
    await _db
        .collection('questions')
        .add(question.toDocument())
        .then((value) => print(value));
  }

  Future deleteQuestion(String id) async {
    final collection = FirebaseFirestore.instance.collection('questions');
    collection
        .doc(id) // <-- Doc ID to be deleted.
        .delete() // <-- Delete
        .then((_) => print('Deleted'))
        .catchError((error) => print('Delete failed: $error'));
  }

  uploadComment(currentUserId, String text, postId, ownerId, String mediaUrl) {}
}
