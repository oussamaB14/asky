import 'package:asky/models/Anwser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnwserService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  // ADD NEW QUESTION TO DB
  Future addQuestion(Anwser anwser) async {
    await _db
        .collection('awnsers')
        .add(anwser.toDocument())
        .then((value) => print(value));
  }

  Future<List<Anwser>> getAllawnsers() async {
    List<Anwser> awnsers = [];
    await _db.collection('awnsers').get().then((value) {
      value.docs.forEach((element) {
        awnsers.add(Anwser.fromDocument(element));
      });
    });
    print(awnsers);
    return awnsers;
  }
}
