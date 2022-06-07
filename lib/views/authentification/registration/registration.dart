import 'dart:io';

import 'package:asky/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:ternav_icons/ternav_icons.dart';

class RegestrationView extends StatefulWidget {
  const RegestrationView({Key? key}) : super(key: key);

  @override
  State<RegestrationView> createState() => _RegestrationViewState();
}

class _RegestrationViewState extends State<RegestrationView> {
  final _formkry = GlobalKey<FormState>();
  List options = ["Teacher", "Student"];
  List options2 = ["LSIM", "LISI", "PREPA", "LTIC", "MRSIM", "MPSE", "MPSSI"];
  int _value = 1;
  int _value2 = 0;
  List selected = [];
  bool isTeacher = false;
  File? image;
  bool isloading = false;
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

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  TextEditingController bioController = TextEditingController();
  final TextEditingController _educationFiled = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ))),
                  onPressed: () {
                    showModalBottomSheet<void>(
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            height: 15.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(4.h),
                              ),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                    leading:
                                        Icon(TernavIcons.lightOutline.folder),
                                    title: Text('Select from Gallery',
                                        style: TextStyle(fontSize: 16.sp)),
                                    onTap: () {
                                      pickImage();
                                    }),
                                ListTile(
                                    leading:
                                        Icon(TernavIcons.lightOutline.camera),
                                    title: Text('Select from Camera',
                                        style: TextStyle(fontSize: 16.sp)),
                                    onTap: () {
                                      pickImageC();
                                    }),
                              ],
                            ),
                          );
                        },
                        context: context);
                  },
                  child: const Text('Select image')),
              SizedBox(height: 2.h),
              ExpansionTile(
                leading: Icon(TernavIcons.lightOutline.profile),
                title: const Text(
                  'Role',
                ),
                children: [
                  Wrap(
                    children: List<Widget>.generate(
                      options.length,
                      (int idx) {
                        return Wrap(children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            child: RawChip(
                                selectedColor: Colors.blue,
                                backgroundColor: const Color(0xFFE1E4F3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45),
                                ),
                                // checkmarkColor: Colors.white,
                                label: Text(
                                  options[idx],
                                ),
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
                                onSelected: (bool selected) {
                                  setState(() {
                                    _value = (selected ? idx : null)!;
                                    if (options[idx] == 'Teacher') {
                                      isTeacher = true;
                                    } else
                                      (isTeacher = false);
                                  });
                                }),
                          ),
                        ]);
                      },
                    ).toList(),
                  ),
                ],
              ),
              ExpansionTile(
                leading: Icon(TernavIcons.lightOutline.statistics_monitor),
                title: const Text('Education Filed'),
                children: [
                  if (isTeacher) ...[
                    // const Home(),
                    TextFormField(
                      controller: _educationFiled,
                      decoration: const InputDecoration(
                        label: Text('Education Filed',
                            style: TextStyle(color: Colors.blue)),
                        hintText: 'enter your Education Filed',
                        helperText:
                            'you can add all the subjects you teach here ',
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3.0),
                        ),
                      ),
                      validator: (String? text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'this filed is required';
                        }
                        return null;
                      },
                    ),
                  ],
                  if (!isTeacher) ...[
                    Wrap(
                      children: List<Widget>.generate(
                        options2.length,
                        (int idx) {
                          return Wrap(children: <Widget>[
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              child: RawChip(
                                  selectedColor: Colors.blue,
                                  backgroundColor: const Color(0xFFE1E4F3),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(45)),
                                  label: Text(options2[idx]),
                                  labelStyle: TextStyle(
                                    color: isDarkTheme
                                        ? _value2 == idx
                                            ? Colors.white
                                            : Colors.black
                                        : _value2 == idx
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                  selected: _value2 == idx,
                                  onSelected: (bool selected) {
                                    setState(() {
                                      _value2 = (selected ? idx : null)!;
                                    });
                                  }),
                            ),
                          ]);
                        },
                      ).toList(),
                    ),
                  ],
                ],
              ),
              ExpansionTile(
                leading: Icon(TernavIcons.lightOutline.chat),
                title: const Text('About you '),
                children: [
                  TextFormField(
                    controller: bioController,
                    decoration: const InputDecoration(
                      label: Text('bio', style: TextStyle(color: Colors.blue)),
                      hintText: 'enter a bio about yourself',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 3.0),
                      ),
                    ),
                    validator: (String? text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'this filed is required';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              if (isloading) ...[
                const Center(
                  child: CircularProgressIndicator(),
                )
              ],
              if (!isloading) ...[
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ))),
                  onPressed: () async {
                    //AuthService().UploadImage(image!);
                    AuthService().updateUserInfo(
                        isTeacher ? 'Teacher' : 'Student',
                        isTeacher ? _educationFiled.text : options2[_value2],
                        bioController.text,
                        image!);
                    await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('Informations confirmed'),
                              content: const Text(
                                  'your account was created , you can log in now'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed('/signin');
                                    },
                                    child: const Text('ok'))
                              ],
                            ));
                  },
                  child: SizedBox(
                    width: 20.h,
                    height: 6.h,
                    child: Center(
                      child: Text(
                        "Confirme",
                        style: TextStyle(fontSize: 2.5.h),
                      ),
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
