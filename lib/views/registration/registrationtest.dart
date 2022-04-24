import 'package:asky/styles/colors.dart';
import 'package:asky/views/registration/test.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:textfield_tags/textfield_tags.dart';

class TestReg extends StatefulWidget {
  const TestReg({Key? key}) : super(key: key);

  @override
  State<TestReg> createState() => _TestRegState();
}

class _TestRegState extends State<TestReg> {
  final _formkry = GlobalKey<FormState>();
  List options = ["Teacher", "Student"];
  List options2 = ["LSIM", "LISI", "PREPA", "LTIC", "MRSIM", "MPSE", "MPSSI"];
  int _value = 1;
  int _value2 = 0;
  List selected = [];
  bool isTeacher = false;

  TextEditingController bioController = TextEditingController();

  TextEditingController _educationFiled = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              // height: double.infinity,
              child: Column(
                children: [
                  Text('pick a photo'),
                  Divider(),
                  CircleAvatar(
                    radius: 5.h,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _handleImageSelection();
                      },
                      child: const Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Center(
                            child: Icon(
                          Icons.person,
                          size: 50,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'you are a ..?',
                  ),
                  Wrap(
                    children: List<Widget>.generate(
                      options.length,
                      (int idx) {
                        return Wrap(children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            child: RawChip(
                                selectedColor: Colors.blue,
                                backgroundColor: Color(0xFFE1E4F3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45),
                                  // side: BorderSide(
                                  //   color: selected.contains(options[idx])
                                  //       ? Colors.blue
                                  //       : Colors.grey,
                                  // ),
                                ),
                                // checkmarkColor: Colors.white,
                                label: Text(options[idx]),
                                selected: _value == idx,
                                onSelected: (bool selected) {
                                  setState(() {
                                    _value = (selected ? idx : null)!;
                                    if (options[idx] == 'Teacher') {
                                      isTeacher = true;
                                    } else
                                      (isTeacher = false);
                                  });
                                  print(idx);
                                  print(_value);
                                  print(isTeacher);
                                }),
                          ),
                        ]);
                      },
                    ).toList(),
                  ),
                  Text('Education Filed'),
                  Divider(),
                  SizedBox(height: 2.h),
                  if (isTeacher) ...[
                    Home(),
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
                              child: RawChip(
                                  // avatar: selected.contains(options2[idx])
                                  //     ? Icon(Icons.check, color: Colors.blue)
                                  //     : null,
                                  selectedColor: Colors.blue,
                                  backgroundColor: Color(0xFFE1E4F3),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(45)),
                                  label: Text(options2[idx]),
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
                  SizedBox(height: 2.h),
                  Text('About you '),
                  TextFormField(
                    controller: bioController,
                    key: _formkry,
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
                  SizedBox(height: 10.h),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ))),
                    onPressed: () async {
                      // if (_formkry.currentState != null &&
                      //     _formkry.currentState!.validate()) {
                      await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text('Informations confirmed'),
                                content: Text(
                                    'your account was created , you can log in now'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushReplacementNamed('/signin');
                                      },
                                      child: Text('ok'))
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _handleImageSelection() async {
  final result = await ImagePicker().pickImage(
    imageQuality: 70,
    maxWidth: 1440,
    source: ImageSource.gallery,
  );
}
