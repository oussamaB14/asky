import 'package:asky/views/Providers/ModalSelectorProvider.dart';
import 'package:asky/widgets/select_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegestrationView extends StatefulWidget {
  const RegestrationView({Key? key}) : super(key: key);

  @override
  State<RegestrationView> createState() => _RegestrationViewState();
}

final _formKey = GlobalKey<FormState>();

class _RegestrationViewState extends State<RegestrationView> {
  get _controller => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: const [
          (BackButton(
            color: Colors.white,
          ))
        ]),
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
                          Text("Student Regestration"),
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
                    // r
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
                    TextButton(
                        style: const ButtonStyle(),
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              context: context,
                              builder: (context) {
                                return const SelectPopup(
                                    isSingle: false,
                                    name: "Education filed",
                                    optionsList: [
                                      "Lsim",
                                      "Lisi",
                                      "Prepa",
                                      "mmmm",
                                      'Teach',
                                      'None'
                                    ]);
                              });
                        },
                        child: const Text("Education filed")),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       print(Provider.of<ModalSelectorProvider>(context,
                    //               listen: false)
                    //           .values);
                    //     },
                    //     child: const Text("Print values")),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
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
    // return Scaffold(
    //     backgroundColor: Colors.white,
    //     body: SingleChildScrollView(
    //       padding: EdgeInsets.all(20),
    //       child: SafeArea(
    //         child: Center(
    //           child: Form(
    //               child: Column(
    //             children: [
    //               Text("REGESTRATION FORM"),
    //               TextFormField(
    //                 decoration: const InputDecoration(
    //                     prefixIcon: Icon(Icons.person),
    //                     hintText: "full name",
    //                     border: OutlineInputBorder(
    //                         borderRadius:
    //                             BorderRadius.all(Radius.circular(40)))),
    //               ),
    //               const SizedBox(
    //                 height: 20,
    //               ),
    //               TextFormField(
    //                 obscureText: true,
    //                 decoration: const InputDecoration(
    //                     prefixIcon: Icon(Icons.person),
    //                     hintText: "",
    //                     border: OutlineInputBorder(
    //                         borderRadius:
    //                             BorderRadius.all(Radius.circular(40)))),
    //               ),
    //               // Container(
    //               //   margin: const EdgeInsets.all(10),
    //               //   child: Row(children: [
    //               //     const Center(child: Text("don't have an account")),
    //               //     InkWell(
    //               //       onTap: () {
    //               //         Navigator.of(context).pushNamed("signup");
    //               //       },
    //               //       child: const Text(
    //               //         "sgin up",
    //               //         style: TextStyle(color: Colors.blue),
    //               //       ),
    //               //     )
    //               //   ]),
    //               // ),
    //               ElevatedButton(
    //                 onPressed: () {},
    //                 child: const Text(
    //                   "submite",
    //                   style: TextStyle(fontSize: 20),
    //                 ),
    //               ),
    //             ],
    //           )),
    //         ),
    //       ),
    //     ));
  }
}
