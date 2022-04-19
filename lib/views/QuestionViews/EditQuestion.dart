import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditQuestion extends StatefulWidget {
  const EditQuestion({Key? key}) : super(key: key);

  @override
  State<EditQuestion> createState() => _EditQuestionState();
}

class _EditQuestionState extends State<EditQuestion> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Question')),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            CommunityMaterialIcons.content_save,
            color: Colors.white,
          ),backgroundColor: Colors.blue,),
      
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Edit title :'),
                  Divider(),
                  Form(
                      child: TextFormField(
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
                  )),
                  Text('Edit Question :'),
                  Divider(),
                  Form(
                      child: TextFormField(
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
                  )),
                  Text('Edit Tag :'),
                  Divider()
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
