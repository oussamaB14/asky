import 'package:asky/views/profile/widgets/Profiledrawer.dart';
import 'package:asky/views/spaces/widgets/addSpaceButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../services/QuestionsService.dart';
import '../../services/user_service.dart';

class StudentProfile extends StatefulWidget {
  // const StudentProfile({});

  @override
  State<StudentProfile> createState() => StudentProfileViewState();
}

class StudentProfileViewState extends State<StudentProfile> {
  AccessToken? _accessToken;
  bool _checking = true;

  get states => null;

  Map<String, dynamic>? _userData;
  QuestionsServices _questionsServices = QuestionsServices();
  // User user;
  int questionCount = 0;
  int anwserCount = 0;
  bool isToggle = true;
  bool isLoading = false;
  // UserModel users;
  int index = 0;
  // currentUserId() {
  //   return firebaseAuth.currentUser?.uid;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('profile'),
        ),
        endDrawer: SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.all(15),
              height: 38.h,
              child: PofileDrawer(),
            ),
          ),
        ),
        floatingActionButton: spaceButton(),
        body: SingleChildScrollView(
            child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('user')
                    .doc(FirebaseAuth.instance.currentUser?.uid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: LinearProgressIndicator());
                  }

                  if (snapshot.hasError) return const Text('Error');
                  var data = snapshot.data;

                  return Card(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 4.h,
                                backgroundColor: Colors.grey,
                                backgroundImage: NetworkImage(data!['imgUrl']),
                              ),
                              SizedBox(width: 2.h),
                              Column(
                                children: [
                                  data != null
                                      ? Text(
                                          data['name'],
                                          // user?.username,
                                          style: GoogleFonts.lato(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium),
                                        )
                                      : Text('error'),
                                  Text(data['role'],
                                      style: GoogleFonts.lato(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                          color: Colors.blue)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 5.h,
                                  ),
                                  Text(
                                    "10",
                                    style: TextStyle(
                                      fontSize: 2.5.h,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1.h,
                                  ),
                                  Text(
                                    "Questions",
                                    style: GoogleFonts.lato(
                                      textStyle:
                                          Theme.of(context).textTheme.headline6,
                                      fontSize: 2.5.h,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6.h,
                                  ),
                                  Text(
                                    "10",
                                    style: TextStyle(
                                      fontSize: 2.5.h,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1.h,
                                  ),
                                  Text("Anwsers",
                                      style: GoogleFonts.lato(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                        fontSize: 2.5.h,
                                      )),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'educationFiled',
                            style: TextStyle(color: Colors.blue),
                          ),
                          Text('bio'),
                          SizedBox(
                            height: 15.h,
                          ),
                          Divider(),
                          SizedBox(
                            width: 1.h,
                          ),
                          Row(
                            children: [
                              // TextButton(
                              //     style: ButtonStyle(
                              //         shape: MaterialStateProperty.all<
                              //                 RoundedRectangleBorder>(
                              //             RoundedRectangleBorder(
                              //                 borderRadius: BorderRadius.circular(18.0),
                              //                 side: BorderSide(color: Colors.red)))),
                              //     onPressed: () {
                              //       setState(() {
                              //         index = 0;
                              //       });
                              //     },
                              //     child: SizedBox(
                              //         width: 20.h,
                              //         child: Center(child: Text("Questions")))),
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    index = 0;
                                  });
                                },
                                child: SizedBox(
                                    width: 19.h,
                                    child: Center(child: Text('Questions'))),
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(),
                                    shape: StadiumBorder(),
                                    textStyle: TextStyle(
                                      fontSize: 2.5.h,
                                      // fontStyle: FontStyle.italic,
                                    )),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    index = 1;
                                  });
                                },
                                child: SizedBox(
                                    width: 19.h,
                                    child: Center(child: Text('Anwsers'))),
                                style: OutlinedButton.styleFrom(
                                  textStyle: TextStyle(
                                    fontSize: 2.5.h,
                                    // fontStyle: FontStyle.italic,
                                  ),
                                  shape: StadiumBorder(),
                                ),
                              ),
                              // TextButton(
                              //     style: ButtonStyle(
                              //         shape: MaterialStateProperty.all<
                              //                 RoundedRectangleBorder>(
                              //             RoundedRectangleBorder(
                              //                 borderRadius: BorderRadius.circular(18.0),
                              //                 side: BorderSide(color: Colors.red)))),
                              //     onPressed: () {
                              //       setState(() {
                              //         index = 1;
                              //       });
                              //     },
                              //     child: SizedBox(
                              //         width: 20.h,
                              //         child: Center(child: Text("Anwsers")))),
                            ],
                          ),

                          // ToggleSwitch(
                          //   minWidth: 25.h,
                          //   cornerRadius: 20.0,
                          //   activeFgColor: Colors.white,
                          //   inactiveBgColor: Color(0XFFEDEDED),
                          //   activeBgColor: [Color.fromARGB(255, 153, 215, 243)],
                          //   totalSwitches: 2,
                          //   initialLabelIndex: index,
                          //   borderWidth: 1.0,
                          //   borderColor: [Colors.lightBlue],
                          //   labels: const [
                          //     'Questions',
                          //     'Anwsers',
                          //   ],
                          //   customTextStyles: [
                          //     TextStyle(
                          //       // color: Colors.brown,
                          //       fontSize: 2.h,
                          //       // fontWeight: FontWeight.normal),
                          //     ),
                          //     TextStyle(
                          //       // color: Colors.brown,
                          //       fontSize: 2.h,
                          //       // fontWeight: FontWeight.normal
                          //     ),
                          //   ],
                          //   onToggle: (index) {
                          //     setState(() => this.index = index!);
                          //   },
                          // ),
                          SizedBox(
                            height: 2.h,
                          ),

                          IndexedStack(
                            index: index,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    CircleAvatar(),
                                    CircleAvatar(),
                                    CircleAvatar(),
                                    CircleAvatar(),
                                    CircleAvatar(),
                                  ],
                                ),
                                color: Colors.black,
                                width: 15.h,
                              ),
                              Container(
                                child: Column(
                                  children: [Text("Anwsers")],
                                ),
                              )
                            ],
                          ),
                          // throw Text('data')
                        ],
                      ),
                    ),
                  );
                })));
  }

  MaterialStateProperty<BorderSide> getBorder(Color color, Color colorPressed) {
    final getBorder = (Set<MaterialState> state) {
      if (states.contains(MaterialState.pressed)) {
        return BorderSide(color: colorPressed, width: 2);
      } else {
        return BorderSide(color: color, width: 2);
      }
    };

    return MaterialStateProperty.resolveWith((getBorder));
  }
}
