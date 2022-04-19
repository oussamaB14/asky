import 'package:asky/models/Question.dart';
import 'package:asky/services/QuestionsService.dart';
import 'package:asky/services/auth_service.dart';
import 'package:asky/views/QuestionViews/widgets/QuestionCard.dart';
import 'package:asky/views/profile/student_profile.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles/colors.dart';
import '../tags/addTag.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _questionsServices
              .addQuestion(Question(
                  username: 'username.value.text,',
                  title: titleController.value.text,
                  content: contentController.value.text,
                  authorId: AuthService().user?.uid ?? 'ididididi'))
              .whenComplete(() {
            Navigator.of(context).pushNamed("/homepage");
          });
        },
        child: const Icon(
          CommunityMaterialIcons.arrow_right,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
                child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  style: GoogleFonts.nunitoSans(
                      textStyle: Theme.of(context).textTheme.headline2),
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(),
                      contentPadding: EdgeInsets.all(15),
                      labelText: 'Title',
                      hintText: 'Enter title here',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: InputBorder.none),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Divider(),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: GoogleFonts.nunitoSans(
                      textStyle: Theme.of(context).textTheme.headline2),
                  controller: contentController,
                  decoration: const InputDecoration(
                      labelText: 'Question',
                      hintText: 'Ask a question ..',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      hintMaxLines: 5,
                      contentPadding: EdgeInsets.all(15),
                      border: InputBorder.none),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Question';
                    }
                    return null;
                  },
                ),
              ],
            )),
            AddTag(),
          ],
        ),
      )),
    );
  }
}
