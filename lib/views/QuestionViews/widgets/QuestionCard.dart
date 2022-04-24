import 'package:asky/models/Question.dart';
import 'package:asky/views/QuestionViews/EditQuestion.dart';
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
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue, width: 20.h),
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
                  backgroundColor: Colors.brown.shade800,
                  child: const Text('AH'),
                ),
                SizedBox(width: 2.h),
                Text("username"),
                Spacer(),
                // Icon(Icons.edit),
                PopupMenuButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    onSelected: (int item) => onSelected(context, item),
                    itemBuilder: (context) => const [
                          PopupMenuItem<int>(
                              value: 0,
                              child: ListTile(
                                title: Text('Edit'),
                                leading: Icon(Icons.edit),
                              )),
                          PopupMenuItem<int>(
                              value: 1,
                              child: ListTile(
                                  title: Text('Delete'),
                                  leading: Icon(
                                    Icons.delete,
                                  )))
                        ])
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
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'addanwser');
                  },
                  child: Icon(CommunityMaterialIcons.card_text_outline),
                ),
                // Icon(CommunityMaterialIcons.chat_outline),
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

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => EditQuestion())));
      break;
  }
}
