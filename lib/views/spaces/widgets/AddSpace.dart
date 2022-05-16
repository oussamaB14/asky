import 'package:asky/services/SpaceService.dart';
import 'package:asky/services/QuestionsService.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/SpaceM.dart';

class AddSpace extends StatefulWidget {
  const AddSpace({Key? key}) : super(key: key);

  @override
  State<AddSpace> createState() => _AddSpaceState();
}

class _AddSpaceState extends State<AddSpace> {
  TextEditingController spacename = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a Space"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SpaceService()
              .addSopace(Space(
            spacePhoto: 'spacePhoto',
            tags: [],
            spaceName: spacename.value.text,
          ))
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
                    controller: spacename,
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
                    controller: spacename,
                    style: GoogleFonts.nunitoSans(
                        textStyle: Theme.of(context).textTheme.headline2),
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(),
                        contentPadding: EdgeInsets.all(15),
                        labelText: 'Description',
                        hintText: 'enter description here',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: InputBorder.none),
                    validator: _requiredValidator),
              ],
            )),
            // AddTag(),
          ],
        ),
      )),
    );
  }

  String? _requiredValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'this filed is required';
    }
    return null;
  }
}
