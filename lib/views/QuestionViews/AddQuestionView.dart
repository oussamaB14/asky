import 'package:asky/models/Question.dart';
import 'package:asky/services/QuestionsService.dart';
import 'package:asky/services/auth_service.dart';
import 'package:asky/services/user_service.dart';
import 'package:asky/views/QuestionViews/widgets/QuestionCard.dart';
import 'package:asky/views/profile/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

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
        title: const Text("Add question"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _questionsServices
              .addQuestion(
            Question(
                username:
                    FirebaseAuth.instance.currentUser?.displayName ?? 'Error',
                title: titleController.value.text,
                content: contentController.value.text,
                authorId: AuthService().user?.uid ?? 'ididididi',
                id: FirebaseFirestore.instance.collection('questions').doc().id,
                mediaUrl: '',
                userPhoto: ''),
            // tags :
          )
              .whenComplete(() {
            Navigator.of(context).pushNamed("/homepage");
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Question added ..")));
          });
        },
        child: const Icon(
          CommunityMaterialIcons.arrow_right,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF7f5af0),
      ),
      body: SingleChildScrollView(
          child: Card(
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
                    validator: (String? text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'this filed is required';
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
                    validator: (String? text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'this filed is required';
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  SizedBox(height: 2.h),
                  const AddTag()
                ],
              )),
              // AddTag(),
            ],
          ),
        ),
      )),
    );
  }
}
