import 'package:asky/models/Polls.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PollsService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future addPolls(PollsModel poll) async {
    try {
      await FirebaseFirestore.instance
          .collection('polls')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get()
          .then((value) {
        poll.userPhoto = value['imgUrl'];
      });
    } catch (e) {}
    await _db
        .collection('questions')
        .add(poll.toDocument())
        .then((value) => print(value));
  }

  Future<List<PollsModel>> getAllPolls() async {
    List<PollsModel> polls = [];
    await _db.collection('questions').get().then((value) {
      for (var element in value.docs) {
        polls.add(PollsModel.fromDocument(element));
      }
    });
    // print(questions);
    return polls;
  }

  void addPoll(PollsModel poll, context) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) async {
      poll.userPhoto = value['imgUrl'];
      await FirebaseFirestore.instance
          .collection("polls")
          .add(poll.toDocument())
          .then((value) => poll.options.forEach((element) async {
                await value.update({element: []});
              }));
    }).whenComplete(() => Navigator.of(context).pushNamed("/homepage"));
  }
}
