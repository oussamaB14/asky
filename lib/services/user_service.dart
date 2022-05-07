import 'dart:io';
import 'package:asky/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:asky/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserService extends Service {
  //get the authenticated uis
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  // FirebaseStorage storage = FirebaseStorage.instance;
  String? currentUid() {
    return _auth.currentUser?.uid;
  }

  void updateUserProfile(String name, String educationfiled, String bio) async {
    /*await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({"bio": bio, "name": name, "educationFiled": educationfiled});*/

    if (name.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({"name": name});
    }

    if (educationfiled.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({"educationFiled": educationfiled});
    }

    if (bio.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({"bio": bio});
    }
  }

  Future<String> getUserProfileUrl() async {
    String x = '';
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get()
          .then((value) {
        x = value['imgUrl'];
      });
      return x;
    } catch (e) {
      return x;
    }
  }

//updates user profile in the Edit Profile Screen
  // Reference profilePic = FirebaseStorage.instance.ref().child('profilePic');
  // updateProfile(
  //     {required File image,
  //     required String name,
  //     String? bio,
  //     required String educationFiled}) async {
  //   DocumentSnapshot doc =
  //       await _db.collection('user').doc(currentUid()).get();
  //   var users = UserModel.fromDocument(doc.data() as Map<String, dynamic>);
  //   users.name = name;
  //   users.bio = bio!;
  //   users.educationFiled = educationFiled;
  //   if (image != null) {
  //     users.photoUrl = await uploadImage(profilePic, image);
  //   }
  //   await _db.collection('users').doc(currentUid()).update({
  //     'username': name,
  //     'bio': bio,
  //     'educationFiled': educationFiled,
  //     "photoUrl": users.photoUrl,
  //   });

  //   return true;
  // }
}
