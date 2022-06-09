import 'package:asky/views/spaces/widgets/AddSpace.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/SpaceM.dart';

class SpaceService {
  Future addSopace(Space space) async {
    await _db
        .collection('space')
        .add(space.toJson())
        .then((value) => print(value));
  }

  final FirebaseFirestore _db = FirebaseFirestore.instance;
//

  Future<List<Space>> getSpaces() async {
    var ref = _db.collection('space');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var spaces = data.map((d) => Space.fromJson(d));
    return spaces.toList();
  }

  // Future<QuerySnapshot> getTableSpace() async {
  //   var ref = _db.collection('space');
  //   var snapshot = await ref.get();
  //   var data = snapshot.docs.map((s) => s.data());
  //   var spaces = data.map((d) => Space.fromJson(d));
  //   return spaces;
  // }
}
