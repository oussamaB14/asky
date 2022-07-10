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
  final _answerKey = GlobalKey<FormState>();
  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          if (_answerKey.currentState != null &&
              _answerKey.currentState!.validate()) {
            AnwserService().editAnswer(
                widget.parentDocId, widget.answerId, contentController.text);
            Navigator.of(context).pushNamed("/homepage");
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Answer updated ..")));
          }
        }),
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(children: [
        const ListTile(
          title: Text('Edit answer :'),
        ),
        Form(
            child: TextFormField(
          key: _answerKey,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: GoogleFonts.nunitoSans(
              textStyle: Theme.of(context).textTheme.headline2),
          controller: contentController,
          decoration: const InputDecoration(
              labelText: 'Answer',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              hintMaxLines: 5,
              contentPadding: EdgeInsets.all(15),
              border: InputBorder.none),
          validator: _requiredValidator,
        )),
      ]),
    );
  }
}

String? _requiredValidator(String? text) {
  if (text == null || text.trim().isEmpty) {
    return 'this filed is required';
  }
  return null;
}
