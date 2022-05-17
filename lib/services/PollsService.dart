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

  void voteOption(String docId, String optionName) async {
    await FirebaseFirestore.instance
        .collection('polls')
        .doc(docId)
        .get()
        .then((doc) async {
      List<dynamic> options = doc['options'];

      options.forEach((element) async {
        List<dynamic> option = doc[element];

        if (option.contains(FirebaseAuth.instance.currentUser?.uid)) {
          await FirebaseFirestore.instance
              .collection('polls')
              .doc(docId)
              .update({
            element:
                FieldValue.arrayRemove([FirebaseAuth.instance.currentUser?.uid])
          });
        }

        if (!option.contains(FirebaseAuth.instance.currentUser?.uid) &&
            element == optionName) {
          await FirebaseFirestore.instance
              .collection('polls')
              .doc(docId)
              .update({
            element:
                FieldValue.arrayUnion([FirebaseAuth.instance.currentUser?.uid])
          });
        }
      });
    });
  }

  Future<double> getOptionPercentage(String docId, String optionName) async {
    List<int> numbers = [];
    double sum = 0;
    int myOption = 0;
    await FirebaseFirestore.instance
        .collection('polls')
        .doc(docId)
        .get()
        .then((doc) async {
      List<dynamic> options = doc['options'];

      options.forEach((element) async {
        if (element == optionName) {
          myOption = options.indexOf(element);
        }

        List<dynamic> option = doc[element];
        numbers.add(option.length);
      });
    });

    numbers.forEach((element) {
      sum += element;
    });
    return sum == 0 ? 0.0 : numbers[myOption] / sum;
  }
}
