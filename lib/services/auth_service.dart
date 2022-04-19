import 'package:path/path.dart';

import 'package:asky/views/Wrapper.dart';
import 'package:asky/views/home/home_View.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  User? user;
  // google sign in logic
  Future signInwithGoogle() async {
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
    } on FirebaseAuthException catch (e) {
      print(e.message);
      rethrow;
    }

    return user;
    notifyListeners();
  }

  Stream<String> get authStateChanged => _auth.authStateChanges().map(
        (User? user) => user!.uid,
      );

  Future getCurrentUser() async {
    return (_auth.currentUser)?.uid;
  }

  getProfileImage() {
    if (_auth.currentUser?.photoURL != null) {
      return Image.network('_auth.currentUser?.photoURL',
          height: 100, width: 100);
    } else {
      const Icon(Icons.account_circle, size: 100);
    }
  }

  void signInWithEmail(String email, String password, context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() {
        if (FirebaseAuth.instance.currentUser != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("You are logged in")));
          Navigator.pushReplacementNamed(context, "/homepage");
        }
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  void signUpWithEmail(String email, String password, context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance.collection('user').add({'email': email});
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Sign up Succeeded'),
                content: Text('your account was created , you can log in now'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('ok'))
                ],
              ));
    } on FirebaseAuthException catch (e) {
      _handleSignUpError(e);
    }
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text(e.message.toString())));
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
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) => AlertDialog(
    //           title: Text('Sign up Failed'),
    //           content: Text(messageToDisplay),
    //           actions: [
    //             TextButton(
    //                 onPressed: () {
    //                   Navigator.of(context).pop();
    //                 },
    //                 child: Text('Ok'))
    //           ],
    //         ));
  }

  void signOut(context) {
    FirebaseAuth.instance.signOut();
    Navigator.popAndPushNamed(
      context,
      'Welcomepage',
    );
  }
}
