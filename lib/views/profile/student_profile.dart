import 'package:asky/views/authentification/signin_view.dart';
import 'package:asky/styles/colors.dart';
import 'package:asky/views/profile/widgets/Profiledrawer.dart';
import 'package:asky/views/registration/student_view.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../models/Question.dart';
import '../../models/user.dart';
import '../../services/QuestionsService.dart';
import '../QuestionViews/widgets/QuestionCard.dart';

class StudentProfile extends StatefulWidget {
  final proffileId;
  StudentProfile({this.proffileId});

  @override
  State<StudentProfile> createState() => StudentProfileViewState();
}

// TextEditingController username = TextEditingController();
//  late final UserModle user;

class StudentProfileViewState extends State<StudentProfile> {
  AccessToken? _accessToken;
  bool _checking = true;
  _checkIfisLoggedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;

    setState(() {
      _checking = false;
    });

    if (accessToken != null) {
      print(accessToken.toJson());
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
      });
    }
  }

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
              height: 51.h,
              child: PofileDrawer(),
            ),
          ),
        ),
        body: Card(
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
                        backgroundColor: Colors.brown.shade800,
                        child: Text('data')
                        // Image.network(_userData!['picture']['data']['url']),
                        ),
                    SizedBox(width: 2.h),
                    Column(
                      children: [
                        _userData != null
                            ? Text(
                                'name: ${_userData!['name']}',
                                // user?.username,
                                style: GoogleFonts.lato(
                                    textStyle:
                                        Theme.of(context).textTheme.headline1),
                              )
                            : Text('useername'),
                        Text("Teacher/Student",
                            style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.headline6,
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
                            textStyle: Theme.of(context).textTheme.headline6,
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
                              textStyle: Theme.of(context).textTheme.headline6,
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
                  "Education filed",
                  style: TextStyle(color: Colors.blue),
                ),
                Text("bio"),
                SizedBox(
                  height: 15.h,
                ),
                Divider(),
                SizedBox(
                  width: 1.h,
                ),
                // TextButton(
                //     onPressed: () {
                //       setState(() {
                //         index = 0;
                //       });
                //     },
                //     child: SizedBox(width: 20.h, child: Text("questions"))),
                // TextButton(
                //     onPressed: () {
                //       setState(() {
                //         index = 1;
                //       });
                //     },
                //     child: SizedBox(width: 20.h, child: Text("anwsers"))),
                ToggleSwitch(
                  minWidth: 25.h,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Color(0XFFEDEDED),
                  activeBgColor: [Color.fromARGB(255, 153, 215, 243)],
                  totalSwitches: 2,
                  initialLabelIndex: index,
                  borderWidth: 1.0,
                  borderColor: [Colors.lightBlue],
                  labels: const [
                    'Questions',
                    'Anwsers',
                  ],
                  customTextStyles: [
                    TextStyle(
                      // color: Colors.brown,
                      fontSize: 2.h,
                      // fontWeight: FontWeight.normal),
                    ),
                    TextStyle(
                      // color: Colors.brown,
                      fontSize: 2.h,
                      // fontWeight: FontWeight.normal
                    ),
                  ],
                  onToggle: (index) {
                    setState(() => this.index = index!);
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),

                SingleChildScrollView(
                  child: Container(
                    child: IndexedStack(
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
                              CircleAvatar(),
                              CircleAvatar(),
                              CircleAvatar(),
                              CircleAvatar(),
                              CircleAvatar(),
                              CircleAvatar(),
                              CircleAvatar(),
                              CircleAvatar(),
                              CircleAvatar(),
                              CircleAvatar(),
                              CircleAvatar(),
                              CircleAvatar(),
                              CircleAvatar()
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
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
