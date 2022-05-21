import 'package:asky/models/Question.dart';
import 'package:asky/views/AnwserView/widgets/anwser_button.dart';
import 'package:asky/views/QuestionViews/widgets/QuestionCard.dart';
import 'package:asky/views/QuestionViews/widgets/Question_Menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/assets.dart';
import '../../../styles/colors.dart';
import '../../AnwserView/widgets/anwserCard.dart';
import 'addBookmark.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  QuestionScreen({Key? key, required this.question}) : super(key: key);
  TextEditingController _anwserController = TextEditingController();
  @override
  Widget build(BuildContext context) {
      final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
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
                        backgroundColor: isDarkTheme ? Colors.black : appColor,
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
                          AnswerButton(id: question.id),
                          const Spacer(),
                          AddToBookMark(id: [question.id]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('questions')
                      .doc(question.id)
                      .snapshots(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (!snapshot.hasData) {
                      return const Text('No asnwers');
                    }

                    //var data = snapshot.data;
                    List<dynamic> answers = snapshot.data?['anwsers'];

                    for (int i = 0; i < answers.length; i++) print(answers[i]);
                    return Column(
                      children: [
                        for (int i = 0; i < answers.length; i++)
                          AnwserCard(anwser: answers[i])
                      ],
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
