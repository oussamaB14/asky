import 'package:asky/routes.dart';
import 'package:asky/services/auth_service.dart';
import 'package:asky/views/Admin/login_page.dart';
import 'package:asky/views/QuestionViews/AddQuestionView.dart';
import 'package:asky/views/Quizzes/firestore.dart';
import 'package:asky/views/Quizzes/models.dart';
import 'package:asky/views/explore/controllers/exploreViewController.dart';
import 'package:asky/views/profile/widgets/EditProfile_view.dart';

import 'package:asky/widgets/SplashScreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:asky/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Runner extends StatefulWidget {
  const Runner({Key? key}) : super(key: key);

  @override
  State<Runner> createState() => _RunnerState();
}

class _RunnerState extends State<Runner> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthService>(
                create: (context) => AuthService()),
            ChangeNotifierProvider<UserProfileInfoProvider>(
                create: (context) => UserProfileInfoProvider()),
            ChangeNotifierProvider<ExploreViewController>(
                create: (context) => ExploreViewController()),
            ChangeNotifierProvider<TagsProv>(create: (context) => TagsProv()),
            StreamProvider(
              create: (_) => FirestoreService().streamReport(),
              initialData: Report(),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const Splash(),
            theme: MyThemes().lightTheme,
            darkTheme: MyThemes().darkTheme,
            routes: routes,
          ),
        );
      },
    );
  }
}
