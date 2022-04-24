import 'package:asky/models/Space.dart';
import 'package:asky/views/spaces/widgets/AddSpace.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SpcaeService {
  Future addSopace(Space space) async {
    await _db
        .collection('space')
        .add(space.toDocument())
        .then((value) => print(value));
  }

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<Space>> getAllSpaces() async {
    List<Space> spaces = [];
    await _db.collection('space').get().then((value) {
      for (var element in value.docs) {
        spaces.add(Space.fromDocument(element));
      }
    });
    // print(spaces);
    return spaces;
  }
}
