import 'package:asky/models/Question.dart';
import 'package:asky/services/QuestionsService.dart';
import 'package:asky/styles/colors.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import '../QuestionViews/widgets/QuestionButton.dart';
import '../QuestionViews/widgets/QuestionCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePage> {
  QuestionsServices _questionsServices = QuestionsServices();
  @override
  Widget build(BuildContext context) {
    AppBarTheme appBarTheme = Theme.of(context).appBarTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: questionButton(),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Question>>(
            future: _questionsServices.getAllQuestions(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  return Column(
                      children: List.generate(
                          snapshot.data!.length,
                          (index) =>
                              QuestionCard(question: snapshot.data![index])));
                default:
                  return Text("Error");
              }
            }),
      ),
    );
  }
}
