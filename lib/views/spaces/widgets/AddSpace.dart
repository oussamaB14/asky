import 'dart:io';

import 'package:asky/services/SpaceService.dart';
import 'package:asky/services/QuestionsService.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../../../models/SpaceM.dart';

class AddSpace extends StatefulWidget {
  const AddSpace({Key? key}) : super(key: key);

  @override
  State<AddSpace> createState() => _AddSpaceState();
}

class _AddSpaceState extends State<AddSpace> {
  TextEditingController spacename = TextEditingController();
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
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
                image != null
                    ? CircleAvatar(
                        child: ClipOval(
                          child: Image.file(
                            image!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        radius: 50,
                      )
                    : CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey.shade100,
                        child: Icon(
                          TernavIcons.lightOutline.camera,
                          size: 50,
                        ),
                      ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ))),
                    onPressed: () {
                      showModalBottomSheet<void>(
                          builder: (BuildContext context) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              height: 10.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(4.h),
                                ),
                              ),
                              child: ListTile(
                                  leading:
                                      Icon(TernavIcons.lightOutline.folder),
                                  title: Text('Select from Gallery',
                                      style: TextStyle(fontSize: 16.sp)),
                                  onTap: () {
                                    pickImage();
                                  }),
                            );
                          },
                          context: context);
                    },
                    child: const Text('Select image')),
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
