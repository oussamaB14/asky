import 'package:asky/models/Question.dart';
import 'package:asky/views/AnwserView/widgets/anwser_button.dart';
import 'package:asky/views/QuestionViews/widgets/QuestionCard.dart';
import 'package:asky/views/QuestionViews/widgets/Question_Menu.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'addBookmark.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  QuestionScreen({Key? key, required this.question}) : super(key: key);
  TextEditingController _anwserController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
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
                      const Text("username"),
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
                    children: const [
                      AnwserButton(),
                      Spacer(),
                     AddToBookMark(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
