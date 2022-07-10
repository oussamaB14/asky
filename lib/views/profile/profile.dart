import 'package:asky/constants/assets.dart';
import 'package:asky/styles/colors.dart';
import 'package:asky/views/QuestionViews/widgets/QuestionCard.dart';
import 'package:asky/views/profile/widgets/Profiledrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../models/Question.dart';
import '../../services/QuestionsService.dart';
import '../AnwserView/widgets/anwserCard.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  // const StudentProfile({});

  @override
  State<StudentProfile> createState() => StudentProfileViewState();
}

class StudentProfileViewState extends State<StudentProfile>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

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
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkTheme ? MyColors.backgroundColor : Colors.white,
      appBar: AppBar(
        title: const Text('profile'),
      ),
      endDrawer: SafeArea(
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: const EdgeInsets.all(15),
            height: 34.h,
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
                  return Center(
                      child: LinearProgressIndicator(
                    color: isDarkTheme ? MyColors.green : appColor,
                  ));
                }

                if (snapshot.hasError) return const Text('Error');
                var data = snapshot.data;

                return Container(
                  color: isDarkTheme ? MyColors.backgroundColor : Colors.white,
                  // elevation: 1,
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Wrap(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 1.5.h),
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(data!['imgUrl']),
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
                                      style:
                                          const TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            // Divider(),
                            // SizedBox(height: 2.h),
                            Wrap(children: [
                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('questions')
                                      .snapshots(),
                                  builder: (context, snap) {
                                    if (snap.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text('');
                                    }

                                    if (!snap.hasData) {
                                      return Text('');
                                    }

                                    var data = snap.data;
                                    int nbQuestions = 0;
                                    int nbAnswers = 0;
                                    for (int i = 0;
                                        i < data!.docs.length;
                                        i++) {
                                      if (data.docs[i]['authorId'] ==
                                          FirebaseAuth
                                              .instance.currentUser!.uid) {
                                        nbQuestions++;
                                      }

                                      List<dynamic> answers =
                                          data.docs[i]['anwsers'];

                                      answers.forEach((element) {
                                        if (element['authorId'] ==
                                            FirebaseAuth
                                                .instance.currentUser!.uid) {
                                          nbAnswers++;
                                        }
                                      });
                                    }
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                            nbQuestions.toString() +
                                                ' Questions',
                                            style: TextStyle(
                                              fontSize: 2.5.h,
                                            )),
                                        Text(nbAnswers.toString() + ' Answers',
                                            style: TextStyle(
                                              fontSize: 2.5.h,
                                            )),
                                      ],
                                    );
                                  }),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 1.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  selectedColor:
                                      isDarkTheme ? MyColors.green : appColor,
                                  disabledColor: Colors.grey,
                                  color: Colors.grey,
                                  fillColor: Colors.transparent,
                                  selectedBorderColor:
                                      isDarkTheme ? MyColors.green : appColor,
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
                            ////////////////////////6666666666666666666////////////////////////////

                            ////////////////////////////////////////////////////////////
                            IndexedStack(
                              index: index,
                              children: [
                                Container(
                                  color: isDarkTheme
                                      ? MyColors.backgroundColor
                                      : Theme.of(context).cardColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection('questions')
                                            .where('authorId',
                                                isEqualTo: FirebaseAuth
                                                    .instance.currentUser!.uid)
                                            .snapshots(),
                                        builder: ((context, snap) {
                                          if (snap.connectionState ==
                                              ConnectionState.waiting) {
                                            return Text('');
                                          }

                                          if (!snap.hasData) {
                                            return Text('');
                                          }

                                          var data = snap.data;

                                          return Column(
                                            children: [
                                              for (int i = 0;
                                                  i < data!.docs.length;
                                                  i++)
                                                QuestionCard(
                                                  question: Question(
                                                      username: data.docs[i]
                                                          ['username'],
                                                      userPhoto: data.docs[i]
                                                          ['userPhoto'],
                                                      title: data.docs[i]
                                                          ['title'],
                                                      content: data.docs[i]
                                                          ['content'],
                                                      authorId: data.docs[i]
                                                          ['authorId'],
                                                      id: data.docs[i].id,
                                                      mediaUrl: data.docs[i]
                                                          ['mediaUrl'],
                                                      tags: data.docs[i]
                                                          ['tags'],
                                                      anwsers: data.docs[i]
                                                          ['anwsers']),
                                                )
                                            ],
                                          );
                                        })),
                                  ),
                                ),
                                Container(
                                  color: isDarkTheme
                                      ? MyColors.backgroundColor
                                      : Theme.of(context).cardColor,
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: StreamBuilder<QuerySnapshot>(
                                          stream: FirebaseFirestore.instance
                                              .collection('questions')
                                              .snapshots(),
                                          builder: ((context, snap) {
                                            if (snap.connectionState ==
                                                ConnectionState.waiting) {
                                              return Text('');
                                            }

                                            if (!snap.hasData) {
                                              return Text('');
                                            }

                                            var data = snap.data;
                                            List<dynamic> myAnswers = [];
                                            for (int i = 0;
                                                i < data!.docs.length;
                                                i++) {
                                              List<dynamic> answers =
                                                  data.docs[i]['anwsers'];

                                              answers.forEach((element) {
                                                if (element['authorId'] ==
                                                    FirebaseAuth.instance
                                                        .currentUser!.uid) {
                                                  myAnswers.add(element);
                                                }
                                              });
                                            }
                                            return Column(
                                              children: [
                                                for (int i = 0;
                                                    i < myAnswers.length;
                                                    i++)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 6),
                                                    child: AnwserCard(
                                                        anwser: myAnswers[i]),
                                                  )
                                              ],
                                            );
                                          }))),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
