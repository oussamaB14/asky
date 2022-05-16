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
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      appBar: AppBar(title: const Text('Edit Question')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
                const Text('Edit title :'),
                const Divider(),
                Form(
                    child: TextFormField(
                  controller: titleController,
                  style: GoogleFonts.nunitoSans(
                      textStyle: Theme.of(context).textTheme.headline2),
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(),
                      contentPadding: EdgeInsets.all(15),
                      labelText: 'Title',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: InputBorder.none),
                )),
                const Text('Edit Question :'),
                const Divider(),
                Form(
                    child: TextFormField(
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
                )),
                const Text('Edit Tag :'),
                const Divider()
              ],
            ),
          )),
    );
  }
}
