import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles/colors.dart';

class Student extends StatefulWidget {
  const Student({Key? key}) : super(key: key);

  @override
  State<Student> createState() => _StudentState();
}

final _formKey = GlobalKey<FormBuilderState>();
TextEditingController usernameController = TextEditingController();

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Text(
              'Student Registration',
              style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.headline4),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
                child: Column(children: [
              TextFormField(
                 controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username ',
                  hintText: 'enter your name here',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: MyColors.yellow),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.blue),
                    gapPadding: 10,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
            ])),
            SizedBox(
              height: 20,
            ),
            FormBuilder(
                child: Column(
              children: [
                FormBuilderDropdown(
                  name: 'education filed',
                  decoration: InputDecoration(
                    labelText: 'education filed',
                  ),
                  // initialValue: 'Male',
                  allowClear: true,
                  hint: Text('Select education filed'),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: [
                    "LSIM",
                    "LISI",
                    "LTIC",
                    "PREPA",
                  ]
                      .map((education) => DropdownMenuItem(
                            value: education,
                            child: Text('$education'),
                          ))
                      .toList(),
                ),
              ],
            ))
          ],
        )),
      ),
    );
  }
}
