import 'package:asky/models/Question.dart';
import 'package:asky/views/profile/student_profile.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class QuestionCard extends StatelessWidget {
  // CARD SHOWS THE QUESTION JUST FOR TEST
  const QuestionCard({Key? key, required this.question}) : super(key: key);
  final Question question;

//   State<QuestionCard> createState() => QuestionCardState();
// }

// class QuestionCardState extends State<QuestionCard> {
//   bool saved = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.brown.shade800,
                  child: const Text('AH'),
                ),
                SizedBox(width: 2.h),
                Text("username"),
              ],
            ),
            SizedBox(height: 1.5.h),
            Text(
              question.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Divider(
              height: 1.h,
            ),
            Text(
              question.content,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 1.5.h),
            Row(
              children: [
                // GestureDetector(
                //   onTap: () {
                //     // setState(() {
                //     //   saved = !saved;
                //     // });
                //   },
                //   // child: Icon(saved ? Icons.bookmark : Icons.bookmark_outline),
                // ),
                Icon(CommunityMaterialIcons.chat_outline),
                Spacer(),
                Icon(CommunityMaterialIcons.bookmark_outline),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
