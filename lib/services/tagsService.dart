import 'package:asky/models/tags.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TagsService {
  Future addQuestion(TagModel tags) async {
    await _db
        .collection('tags')
        .add(tags.toDocument())
        .then((value) => print(value));
  }

  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<TagModel>> getTags() async {
    List<TagModel> tags = [];
    await _db.collection('tags').get().then((value) {
      value.docs.forEach((element) {
        tags.add(TagModel.fromDocument(element));
      });
    });
    print(tags);
    return tags;
  }
}
