import 'package:asky/constants/assets.dart';
import 'package:asky/models/Anwser.dart';
import 'package:asky/models/Question.dart';
import 'package:asky/styles/colors.dart';
import 'package:asky/views/QuestionViews/EditQuestion.dart';
import 'package:asky/views/QuestionViews/widgets/Question_Menu.dart';
import 'package:asky/views/QuestionViews/widgets/Question_item_view.dart';
import 'package:asky/views/profile/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
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
              Row(
                children: [
                  for (int i = 0; i < question.tags.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: RawChip(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: isDarkTheme ? MyColors.green : appColor,
                                width: 0.4),
                            borderRadius: BorderRadius.circular(45)),
                        backgroundColor:
                            isDarkTheme ? Colors.black : Colors.white,
                        label: Text(
                          question.tags[i],
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: isDarkTheme ? Colors.white : appColor),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 1.5.h),
              Row(
                children: [
                  AnswerButton(
                    id: question.id,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      question.anwsers.length.toString(),
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: isDarkTheme ? MyColors.green : appColor),
                    ),
                  ),
                  const Spacer(),
                  AddToBookMark(
                    id: [question.id],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
