import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../services/AnwserService.dart';

class EditAnwser extends StatefulWidget {
  final String parentDocId, answerId;
  const EditAnwser(
      {Key? key, required this.parentDocId, required this.answerId})
      : super(key: key);

  @override
  State<EditAnwser> createState() => _EditAnwserState();
}

class _EditAnwserState extends State<EditAnwser> {
  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (() {
        AnwserService().editAnswer(
            widget.parentDocId, widget.answerId, contentController.text);
      })),
      body: Column(children: [
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
      ]),
    );
  }
}
