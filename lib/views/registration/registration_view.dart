import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(children: [
                        Text(
                          "Contunie as :",
                           
                        ),
                      ]),
                    ),
                  ),
                  Divider(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        // backgroundColor: MaterialStateProperty.all(
                        //     Color.fromARGB(255, 224, 46, 201)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ))),
                    onPressed: () {
                      Navigator.of(context).pushNamed("teacher");
                    },
                    child: SizedBox(
                      width: 20.h,
                      height: 6.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(width: 60),
                          Center(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Expanded(
                                child: Text(
                                  "Teacher",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 3.h),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 30),
                          const Icon(CommunityMaterialIcons.arrow_right_thick)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.5.h),
                  ElevatedButton(
                    style: ButtonStyle(
                        // backgroundColor: MaterialStateProperty.all(
                        //     Color.fromARGB(255, 224, 46, 201)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ))),
                    onPressed: () {
                      Navigator.of(context).pushNamed("Student");
                    },
                    child: SizedBox(
                      width: 20.h,
                      height: 6.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(width: 60),
                          Center(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Expanded(
                                child: Text(
                                  "Student",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 3.h),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 30),
                          const Icon(CommunityMaterialIcons.arrow_right_thick)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
