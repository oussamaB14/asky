import 'package:asky/constants/assets.dart';
import 'package:asky/models/Polls.dart';
import 'package:asky/services/PollsService.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../styles/colors.dart';

class AddPoll extends StatefulWidget {
  const AddPoll({Key? key}) : super(key: key);

  @override
  State<AddPoll> createState() => _AddPollState();
}

class _AddPollState extends State<AddPoll> {
  List<TextEditingController> _controllers = [];
  TextEditingController questionController = TextEditingController();
  List<TextField> _fields = [];
  PollsService _pollsService = PollsService();

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
        backgroundColor: isDarkTheme ? Colors.black : Colors.white,
        appBar: AppBar(title: const Text('add poll')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_key.currentState != null && _key.currentState!.validate()) {
              List<String> options = [];
              for (var element in _controllers) {
                // if ((element.text).trim().isEmpty) {
                //   continue;
                // }
                options.add(element.text);
              }

              if (options.length > 2) {
                PollsService().addPoll(
                    PollsModel(
                        username:
                            FirebaseAuth.instance.currentUser?.displayName ??
                                "",
                        userPhoto: "",
                        question: questionController.text,
                        authorId: FirebaseAuth.instance.currentUser?.uid ?? "",
                        options: options),
                    context);
              } else {
                print('You need to add atleast to choices!');
                const AlertDialog(
                  title: Text('Error'),
                  content: Text('You need to add atleast to choices!'),
                );
              }
            }
          },
          backgroundColor: isDarkTheme ? MyColors.green : appColor,
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                  key: _key,
                  controller: questionController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'ask a question',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 42, vertical: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: MyColors.black),
                      gapPadding: 10,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: appColor),
                      gapPadding: 10,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'this filed is required';
                    }
                    return null;
                  }),
              _addTile(),
              ListTile(
                leading: Icon(
                  Icons.warning,
                  color: MyColors.purple,
                ),
                title: Text(
                  'you can only add up to five options ',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              Expanded(child: _listView()),
            ],
          ),
        ));
  }

  Widget _addTile() {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return ListTile(
        title: Icon(
          Icons.add,
          color: isDarkTheme ? MyColors.green : appColor,
          size: 4.h,
        ),
        onTap: () {
          if (_controllers.length <= 4) {
            final controller = TextEditingController();
            final field = TextField(
              // validator: _requiredValidator,
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Choice ${_controllers.length + 1}",
              ),
            );

            setState(() {
              _controllers.add(controller);
              _fields.add(field);
            });
          }
        });
  }

  Widget _listView() {
    return ListView.builder(
      itemCount: _fields.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(5),
          child: _fields[index],
        );
      },
    );
  }
}

String? _requiredValidator(String? text) {
  if (text == null || text.trim().isEmpty) {
    return 'this filed is required';
  }
  return null;
}
