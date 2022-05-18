import 'package:asky/models/Question.dart';
import 'package:asky/services/QuestionsService.dart';
import 'package:asky/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../constants/tags.dart';

class AddQuestionView extends StatefulWidget {
  const AddQuestionView({
    Key? key,
  }) : super(key: key);

  @override
  State<AddQuestionView> createState() => _AddQuestionViewState();
}

class _AddQuestionViewState extends State<AddQuestionView> {
  int _value = 1;
  final QuestionsServices _questionsServices = QuestionsServices();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  final _questionKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add question"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_questionKey.currentState != null &&
              _questionKey.currentState!.validate()) {
            _questionsServices
                .addQuestion(
              Question(
                  username:
                      FirebaseAuth.instance.currentUser?.displayName ?? 'Error',
                  title: titleController.value.text,
                  content: contentController.value.text,
                  authorId: AuthService().user?.uid ?? 'ididididi',
                  id: FirebaseFirestore.instance
                      .collection('questions')
                      .doc()
                      .id,
                  mediaUrl: '',
                  userPhoto: '',
                  // tags: [MyList.tags[idx]],
                  ),
            )
                .whenComplete(() {
              Navigator.of(context).pushNamed("/homepage");
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Question added ..")));
            });
          }
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
                  key: _questionKey,
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
                          validator: _requiredValidator),
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
                          validator: _requiredValidator),
                      const Divider(),
                      SizedBox(height: 2.h),
                      const Text('add tag'),
                      Wrap(
                        children: List<Widget>.generate(
                          MyList.tags.length,
                          (int idx) {
                            return Container(
                              height: 5.h,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              child: RawChip(
                                  backgroundColor: Colors.grey.shade100,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                  label: Text(MyList.tags[idx]),
                                  labelStyle: TextStyle(
                                    color: isDarkTheme
                                        ? _value == idx
                                            ? Colors.white
                                            : Colors.black
                                        : _value == idx
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                  selected: _value == idx,
                                  showCheckmark: false,
                                  onSelected: (bool selected) {
                                    setState(() {
                                      _value = (selected ? idx : null)!;
                                      print(MyList.tags[idx]);
                                    });
                                  }),
                            );
                          },
                        ).toList(),
                      )
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

String? _requiredValidator(String? text) {
  if (text == null || text.trim().isEmpty) {
    return 'this filed is required';
  }
  return null;
}
