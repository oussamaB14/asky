import 'package:asky/models/tags.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TagsService {
  // Future addQuestion(TagModel tags) async {
  //   await _db
  //       .collection('tags')
  //       .add(tags.toDocument())
  //       .then((value) => print(value));
  // }

  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<TagModel> getTag(String tagId) async {
    var ref = _db.collection('tags').doc(tagId);
    var snapshot = await ref.get();
    return TagModel.fromJson(snapshot.data() ?? {});
  }
}
