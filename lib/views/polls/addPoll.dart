import 'package:asky/constants/assets.dart';
import 'package:community_material_icon/community_material_icon.dart';
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
  List<TextField> _fields = [];

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('add poll')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: appColor,
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
                // controller: usernameController,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'ask a question',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: MyColors.black),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.blue),
                    gapPadding: 10,
                  ),
                ),
                // validator: _requiredValidator
              ),
              _addTile(),
              Expanded(child: _listView()),
            ],
          ),
        ));
  }

  Widget _addTile() {
    return ListTile(
        title: const Icon(Icons.add),
        onTap: () {
          final controller = TextEditingController();
          final field = TextField(
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
