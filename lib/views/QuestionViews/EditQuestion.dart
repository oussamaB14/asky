import 'package:asky/services/QuestionsService.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../constants/tags.dart';
import 'AddQuestionView.dart';

class EditQuestion extends StatefulWidget {
  final String docId;
  const EditQuestion({Key? key, required this.docId}) : super(key: key);

  @override
  State<EditQuestion> createState() => _EditQuestionState();
}

class _EditQuestionState extends State<EditQuestion> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  final _editquestionKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      appBar: AppBar(title: const Text('Edit Question')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_editquestionKey.currentState != null &&
              _editquestionKey.currentState!.validate()) {
            QuestionsServices().editQuestion(
              titleController.text,
              contentController.text,
              Provider.of<TagsProv>(context, listen: false).tags,
              widget.docId,
            );
            Navigator.of(context).pushNamed("/homepage");
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Question updated ..")));
          }
        },
        child: const Icon(
          CommunityMaterialIcons.content_save,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              title: Text('Edit Title :'),
            ),
            const Divider(),
            Form(
              key: _editquestionKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: _requiredValidator,
                    controller: titleController,
                    style: GoogleFonts.nunitoSans(
                        textStyle: Theme.of(context).textTheme.headline2),
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(),
                        contentPadding: EdgeInsets.all(15),
                        labelText: 'Title',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: InputBorder.none),
                  ),
                  const ListTile(
                    title: Text('Edit Question :'),
                  ),
                  const Divider(),
                  TextFormField(
                    validator: _requiredValidator,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: GoogleFonts.nunitoSans(
                        textStyle: Theme.of(context).textTheme.headline2),
                    controller: contentController,
                    decoration: const InputDecoration(
                        labelText: 'Question',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        hintMaxLines: 5,
                        contentPadding: EdgeInsets.all(15),
                        border: InputBorder.none),
                  ),
                ],
              ),
            ),
            ExpansionTile(title: const Text('Edit category'), children: [
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
                      child: Consumer<TagsProv>(
                          builder: (context, tagsProv, child) {
                        return RawChip(
                            backgroundColor: Colors.grey.shade100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45),
                            ),
                            label: Text(MyList.tags[idx]),
                            labelStyle: TextStyle(
                              color: isDarkTheme
                                  ? tagsProv.tags.contains(MyList.tags[idx])
                                      ? Colors.white
                                      : Colors.black
                                  : tagsProv.tags.contains(MyList.tags[idx])
                                      ? Colors.white
                                      : Colors.black,
                            ),
                            selected: tagsProv.tags.contains(MyList.tags[idx]),
                            showCheckmark: false,
                            onSelected: (bool selected) {
                              tagsProv.updateTags(MyList.tags[idx]);
                            });
                      }),
                    );
                  },
                ).toList(),
              ),
            ]),
            const Divider()
          ],
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
