import 'dart:io';

import 'package:asky/models/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:asky/views/Wrapper.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AuthService with ChangeNotifier {
  UserModel? userModel;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final userStream = FirebaseAuth.instance.authStateChanges();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  User? user;
  // final user = FirebaseAuth.instance.currentUser;
  User? getCurrentUser() {
    User? user = _auth.currentUser;
    return user;
  }

  // google sign in logic
  Future signInwithGoogle(context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
      user = _auth.currentUser;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      print(e.message);
      rethrow;
    }
    user = _auth.currentUser;
    await assignUsers();
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pushReplacementNamed(context, '/homepage');
    }

    notifyListeners();
  }

  Stream<String> get authStateChanged => _auth.authStateChanges().map(
        (User? user) => user!.uid,
      );

  // Future getCurrentUser() async {
  //   return (_auth.currentUser)?.uid;
  // }
  Future<String> getCurrentUID() async {
    return (_auth.currentUser!).uid;
  }

  // Future getCurrentUser() async {
  //   return (_auth.currentUser!);
  // }

  getProfileImage() {
    if (_auth.currentUser?.photoURL != null) {
      return Image.network('_auth.currentUser?.photoURL',
          height: 100, width: 100);
    } else {
      const Icon(Icons.account_circle, size: 100);
    }
  }

  Future assignUser() async {
    if (_auth.currentUser != null) {
      _db.collection('user').doc(_auth.currentUser!.uid).get().then((value) {
        if (!value.exists) {
          _db.collection('user').doc(_auth.currentUser!.uid).set({
            'name': user?.displayName ?? 'User Name',
            'id': user?.uid ?? 'userId',
            'email': user?.email ?? 'User Email',
            'imageUrl': user?.photoURL ??
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
            'educationFiled': '',
            'bio': '',
            'Bookmarks': [],
            'Spaces': [],
            'isAdmin': false
          });
        } else {
          userModel =
              UserModel.fromDocument(value.data() as Map<String, dynamic>);
        }
      });
    } else {}
  }

  final authNotifier = ChangeNotifierProvider<AuthService>(create: ((ref) {
    return AuthService();
  }));
////////////////// Sign in with email /////////////////
  void signInWithEmail(String email, String password, context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() {
        if (FirebaseAuth.instance.currentUser != null) {
          kIsWeb
              ? ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("You are logged in")))
              : null;
          Navigator.pushReplacementNamed(
              context, kIsWeb ? "Dahome" : "/homepage");
        }
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

//////////////////// Signup with email ////////////////////////////////////
  Future signUpWithEmail(
      String name, String email, String password, context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
        await FirebaseFirestore.instance
            .collection('user')
            .doc(value.user?.uid)
            .set({
          'email': email,
          'name': name,
          'id': user?.uid,
          'imgUrl': user?.photoURL ??
              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
          'bio': "",
          'educationFiled': "",
          'role': "",
          'Bookmarks': [],
          'Spaces': [],
          'isAdmin': false
        });
      });

      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Sign up Succeeded'),
                content: const Text(
                    'Now add your informations complete your account !'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('test');
                      },
                      child: const Text('ok'))
                ],
              ));
      Navigator.of(context).pushReplacementNamed('test');
    } on FirebaseAuthException catch (e) {
      _handleSignUpError(e);
    }
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text(e.message.toString())));
  }

  void updateUserInfo(
      String role, String educationfiled, String bio, File file) async {
    final UploadTask uploadTask = FirebaseStorage.instance
        .ref()
        .child("profilePics/$DateTime.now().toString()")
        .putFile(file);
    final TaskSnapshot downloadUrl = await uploadTask;
    final String url = await downloadUrl.ref.getDownloadURL();

    await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      "bio": bio,
      "role": role,
      "educationFiled": educationfiled,
      "imgUrl": url
    });
  }

  Future<String> UploadImage(File file) async {
    String filename = DateTime.now().toString();

    final UploadTask uploadTask = FirebaseStorage.instance
        .ref()
        .child("profilePics/$filename")
        .putFile(file);
    final TaskSnapshot downloadUrl = await uploadTask;

    final String url = await downloadUrl.ref.getDownloadURL();
    return url;
    //return url;
  }

  void _handleSignUpError(FirebaseAuthException e) {
    String messageToDisplay;
    switch (e.code) {
      case 'email-already-in-use':
        messageToDisplay = 'This email is already in use';
        break;
      case 'invalid-email':
        messageToDisplay = 'This email is invalid';
        break;
      case 'Operation-not-allowed':
        messageToDisplay = 'this operation is not allowed';
        break;
      case 'weak-password':
        messageToDisplay =
            'This password is too weak! , try with another password.';
        break;
      default:
        messageToDisplay = 'An unknown error occurred';
        break;
    }
  }

///////////////////////////////sign out //////////////////////////////////////
  void signOut(context) {
    FirebaseAuth.instance.signOut();
    Navigator.popAndPushNamed(
      context,
      'Welcomepage',
    );
  }

/////////////////////////Forget password/////////////////////////////////////
  forgotPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

///////// LOGIN WITH FACEBOOK /////////////
  Future loginWithFacebook(context) async {
    try {
      final facebookloginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookloginResult.accessToken!.token);
      //  if (!value.exists){}
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      await FirebaseFirestore.instance
          .collection('user')
          .doc((FirebaseAuth.instance.currentUser?.uid))
          .get()
          .then((value) async {
        if (!value.exists) {
          await FirebaseFirestore.instance
              .collection('user')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .set({
            'email': userData['email'],
            'imgUrl': userData['picture']['data']['url'],
            'name': userData['name'],
            'role': '',
            'educationFiled': '',
            'bio': '',
            'Bookmarks': [],
            'Spaces': [],
            'isAdmin': false
          });
        }
      });

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => Wrapper()), (route) => false);
    } on FirebaseAuthException catch (e) {
      var title = '';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          title = 'this account exists with a different sign in provider';
          break;
        case 'invalid-cridential':
          title = 'unknown error has occurred';
          break;
        case 'operation-not-allowed':
          title = 'this operation is not allowed ';
          break;
        case 'user-disabled':
          title = 'the user you tried to login into is disabled';
          break;
        case 'user-not-found':
          title = 'the user you tried to login into was not found';
          break;
      }
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Login with Facebook Failed'),
                content: Text(title),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Ok'))
                ],
              ));
    }
  }

  ////////// assign user to firestore //////////
  assignUsers() async {
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get()
          .then((value) async {
        if (!value.exists) {
          await FirebaseFirestore.instance
              .collection('user')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .set({
            'name': user?.displayName ?? 'User Name',
            'id': user?.uid ?? 'userId',
            'email': user?.email ?? 'User Email',
            'imgUrl': user?.photoURL ??
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
            'educationFiled': '',
            'bio': '',
            'Bookmarks': [],
            'Spaces': [],
            'role': '',
            'isAdmin': false
          });
        }
      });
    }
  }
}
