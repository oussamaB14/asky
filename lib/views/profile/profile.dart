import 'package:asky/views/profile/widgets/Profiledrawer.dart';
import 'package:asky/views/spaces/widgets/addSpaceButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../services/QuestionsService.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  // const StudentProfile({});

  @override
  State<StudentProfile> createState() => StudentProfileViewState();
}

class StudentProfileViewState extends State<StudentProfile> {
  // bool _checking = true;
  List<bool> isSelected = [true, false];
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
          title: const Text('profile'),
        ),
        endDrawer: SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 38.h,
              child: const PofileDrawer(),
            ),
          ),
        ),
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

                  return Container(
                    color: Theme.of(context).cardColor,
                    // elevation: 1,
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Wrap(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 1.5.h),
                              CircleAvatar(
                                backgroundImage: NetworkImage(data!['imgUrl']),
                                radius: 4.h,
                              ),
                              SizedBox(width: 1.h),
                              SizedBox(
                                width: 2.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(data['name']),
                                  Text(
                                    data['role'],
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          // Divider(),
                          // SizedBox(height: 2.h),
                          Wrap(children: [
                            Row(
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
                                      textStyle:
                                          Theme.of(context).textTheme.headline6,
                                      fontSize: 2.5.h,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 1.h,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      data['educationFiled'],
                                      style:
                                          const TextStyle(color: Colors.blue),
                                    ),
                                    Text(data['bio']),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ]),
                          ////////////////////////////////////////////////QUESTION ANWSER /////////////////////////////////
                          Center(
                            child: ToggleButtons(
                                selectedColor: const Color(0xFF7f5af0),
                                disabledColor: Colors.grey,
                                color: Colors.grey,
                                fillColor: Colors.transparent,
                                selectedBorderColor: const Color(0xFF7f5af0),
                                borderRadius: BorderRadius.circular(40),
                                borderWidth: 0.2.h,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 45),
                                    child: Text(
                                      'Questions',
                                      style: TextStyle(fontSize: 3.h),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 45),
                                    child: Text('Anwsers',
                                        style: TextStyle(fontSize: 3.h)),
                                  )
                                ],
                                isSelected: isSelected,
                                onPressed: (int newIdx) {
                                  setState(() {
                                    for (int idx = 0;
                                        idx < isSelected.length;
                                        idx++) {
                                      if (idx == newIdx) {
                                        isSelected[idx] = true;
                                      } else {
                                        isSelected[idx] = false;
                                      }
                                    }
                                    this.index = newIdx;
                                  });
                                }),
                          ),
                          IndexedStack(
                            index: index,
                            children: [
                              Container(
                                color: Theme.of(context).cardColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: const [
                                      Text('Questions'),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Theme.of(context).cardColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [Text('Anwsers')],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })));
  }
}
