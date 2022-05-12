import 'package:asky/constants/assets.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../styles/colors.dart';

class AddPoll extends StatelessWidget {
  const AddPoll({Key? key}) : super(key: key);

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
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          width: double.infinity,
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              SizedBox(height: 2.h),
              SizedBox(
                width: 35.h,
                child: TextFormField(
                  // controller: usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Choice',
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
                      borderSide: const BorderSide(color: Colors.blue),
                      gapPadding: 10,
                    ),
                  ),
                  // validator: _requiredValidator
                ),
              ),
              SizedBox(height: 2.h),
              Row(children: [
                SizedBox(
                  width: 35.h,
                  child: TextFormField(
                    // controller: usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Choice 1',
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
                        borderSide: const BorderSide(color: Colors.blue),
                        gapPadding: 10,
                      ),
                    ),
                    // validator: _requiredValidator
                  ),
                ),
                SizedBox(width: 3.h),
                Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 4.h,
                )
              ])
            ]),
          ),
        )),
      ),
    );
  }
}

void _generateNewFilled(String label) {}
