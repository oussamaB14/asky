import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeacherRegView extends StatefulWidget {
  const TeacherRegView({Key? key}) : super(key: key);

  @override
  State<TeacherRegView> createState() => _teacherRegViewState();
}

final _formKey = GlobalKey<FormState>();

class _teacherRegViewState extends State<TeacherRegView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [
            (BackButton(
              color: Colors.white,
            )),
            // PopupMenuButton(
            //     itemBuilder: (context) => [
            //           const PopupMenuItem(
            //             child: Text("First"),
            //             value: 1,
            //           ),
            //           const PopupMenuItem(
            //             child: Text("Second"),
            //             value: 2,
            //           )
            //         ])
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Row(children: const [
                          Text("Teacher Regestration",
                              style: TextStyle(
                                fontSize: 30,
                              )),
                        ]),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "full name ",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "filed of studying ",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          // side: BorderSide(
                          //     color:
                          //         Color.fromARGB(255, 10, 10, 10))
                        ))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
