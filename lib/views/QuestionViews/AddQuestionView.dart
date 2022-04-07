import 'package:asky/models/Question.dart';
import 'package:asky/services/QuestionsService.dart';
import 'package:asky/services/auth_service.dart';
import 'package:asky/views/QuestionViews/widgets/QuestionCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles/colors.dart';

class AddQuestionView extends StatefulWidget {
  const AddQuestionView({
    Key? key,
  }) : super(key: key);

  @override
  State<AddQuestionView> createState() => _AddQuestionViewState();
}

class _AddQuestionViewState extends State<AddQuestionView> {
  QuestionsServices _questionsServices = QuestionsServices();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add question"),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 0,
        child: TextButton(
            onPressed: () {
              _questionsServices
                  .addQuestion(Question(
                      title: titleController.value.text,
                      content: contentController.value.text,
                      authorId: AuthService().user?.uid ?? 'ididididi'))
                  .whenComplete(() => _questionsServices.getAllQuestions());
            },
            child: Text('Post question')),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            // FutureBuilder<List<Question>>(
            //     future: _questionsServices.getAllQuestions(),
            //     builder: (context, snapshot) {
            //       switch (snapshot.connectionState) {
            //         case ConnectionState.waiting:
            //           return Center(
            //             child: CircularProgressIndicator(),
            //           );
            //         case ConnectionState.done:
            //           return Column(
            //               children: List.generate(
            //                   snapshot.data!.length,
            //                   (index) => QuestionCard(
            //                       question: snapshot.data![index])));
            //         default:
            //           return Text("Error");
            //       }
            //     }),
            Form(
                child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  style: GoogleFonts.nunitoSans(
                      textStyle: Theme.of(context).textTheme.bodyText1),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                    
                    ),
                    contentPadding: EdgeInsets.all(40),
                    labelText: 'Title',
                    hintText: 'Enter title here',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    // contentPadding:
                    //     EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: MyColors.yellow),
                      gapPadding: 10,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue),
                      gapPadding: 10,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: GoogleFonts.nunitoSans(
                      textStyle: Theme.of(context).textTheme.headline2),
                  controller: contentController,
                  decoration: InputDecoration(
                    labelText: 'Question',
                    hintText: 'Ask a question ..',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    hintMaxLines: 5,
                    contentPadding: EdgeInsets.all(60),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: MyColors.yellow),
                      gapPadding: 20,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue),
                      gapPadding: 20,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Question';
                    }
                    return null;
                  },
                ),
              ],
            ))
          ],
        ),
      )),
    );
  }
}
