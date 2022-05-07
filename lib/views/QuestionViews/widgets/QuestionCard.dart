import 'package:asky/models/Question.dart';
import 'package:asky/views/QuestionViews/EditQuestion.dart';
import 'package:asky/views/QuestionViews/widgets/Question_Menu.dart';
import 'package:asky/views/QuestionViews/widgets/Question_item_view.dart';
import 'package:asky/views/profile/profile.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../AnwserView/widgets/anwser_button.dart';
import 'addBookmark.dart';

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
    return InkWell(
      onTap: (() {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) =>
                QuestionScreen(question: question),
          ),
        );
      }),
      child: Card(
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
                    backgroundImage: NetworkImage(question.userPhoto),
                  ),
                  SizedBox(width: 2.h),
                  Text(question.username),
                  const Spacer(),
                  const QuestionPopMenu(),
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
                  AnswerButton(
                    id: question.id,
                  ),
                  const Spacer(),
                  const AddToBookMark(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
