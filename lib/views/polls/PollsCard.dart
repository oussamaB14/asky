import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../models/Polls.dart';
import '../QuestionViews/widgets/Question_Menu.dart';

class PollCard extends StatefulWidget {
  const PollCard({Key? key, required this.poll}) : super(key: key);
  final PollsModel poll;

  @override
  State<PollCard> createState() => _PollCardState();
}

class _PollCardState extends State<PollCard> {
  String? user = FirebaseAuth.instance.currentUser?.uid;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (BuildContext context) =>
        //         QuestionScreen(question: question),
        //   ),
        // );
      }),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.poll.userPhoto),
                  ),
                  SizedBox(width: 2.h),
                  Text(widget.poll.username),
                  const Spacer(),
                  const QuestionPopMenu(),
                ],
              ),
              Divider(
                height: 1.h,
              ),
              SizedBox(height: 1.5.h),
              CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 5.0,
                percent: 1.0,
                center: new Text("100%"),
                progressColor: Colors.green,
              )
              // Polls(
              //   children: widget.poll.options,
              //   question: Text(widget.poll.question),
              //   voteData: widget.poll.whoVoted,
              //   currentUser: FirebaseAuth.instance.currentUser?.uid,
              //   creatorID: FirebaseAuth.instance.currentUser?.uid,
              //   onVote: (choice) {
              //     setState(() {
              //       this.usersWhoVoted[user] = choice;
              //     });
              //     if (choice == 1) {
              //       setState(() {
              //         option1 +=p 1.0;
              //       });
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
