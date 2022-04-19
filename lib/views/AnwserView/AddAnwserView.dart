import 'package:asky/views/profile/student_profile.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/Anwser.dart';
import '../../services/AnwserService.dart';
import '../../services/auth_service.dart';

class AddAnwser extends StatefulWidget {
  const AddAnwser({Key? key}) : super(key: key);

  @override
  State<AddAnwser> createState() => _AddAnwserState();
}

class _AddAnwserState extends State<AddAnwser> {
  AnwserService _anwsersServices = AnwserService();
  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _anwsersServices
              .addQuestion(Anwser(
                  username: 'username.value.text',
                  awnser: contentController.value.text,
                  userId: AuthService().user?.uid ?? 'ididididi'))
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
        child: Column(
          children: [
            TextFormField(
              controller: contentController,
              style: GoogleFonts.nunitoSans(
                  textStyle: Theme.of(context).textTheme.headline2),
              decoration: const InputDecoration(
                  labelStyle: TextStyle(),
                  contentPadding: EdgeInsets.all(15),
                  labelText: 'Anwser',
                  hintText: 'Enter title Anwser',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: InputBorder.none),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Anwser';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
