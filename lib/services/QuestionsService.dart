import 'package:asky/models/Question.dart';
import 'package:asky/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionsServices {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  // ADD NEW QUESTION TO DB
  Future addQuestion(Question question) async {
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
    // print(questions);
    return questions;
  }

  Future editQuestion(Question question) async {
    await _db
        .collection('questions')
        .add(question.toDocument())
        .then((value) => print(value));
  }
}
