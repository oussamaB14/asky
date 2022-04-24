import 'package:asky/models/Space.dart';
import 'package:asky/services/SpaceService.dart';
import 'package:asky/services/QuestionsService.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddSpace extends StatefulWidget {
  const AddSpace({Key? key}) : super(key: key);

  @override
  State<AddSpace> createState() => _AddSpaceState();
}

class _AddSpaceState extends State<AddSpace> {
  SpcaeService _spaceServices = SpcaeService();
  TextEditingController spacename = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add question"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _spaceServices
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Divider(),
              ],
            )),
            // AddTag(),
          ],
        ),
      )),
    );
  }
}
