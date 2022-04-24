import 'package:asky/routes.dart';
import 'package:asky/services/auth_service.dart';
import 'package:asky/services/fb_auth.dart';
import 'package:asky/services/test.dart';
import 'package:asky/views/authentification/signin_view.dart';
import 'package:asky/views/authentification/signup_view.dart';
import 'package:asky/views/chat/chat_view.dart';
import 'package:asky/views/home/home_View.dart';
import 'package:asky/views/profile/student_profile.dart';
import 'package:asky/views/registration/registration_view.dart';
import 'package:asky/views/registration/registrationtest.dart';
import 'package:asky/views/registration/student_view.dart';
import 'package:asky/views/tags/chip.dart';
import 'package:asky/views/tags/tags_view.dart';
import 'package:asky/widgets/SplashScreen.dart';
import 'package:asky/widgets/Splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:asky/styles/theme.dart';
import 'package:asky/views/Wrapper.dart';
import 'package:asky/views/authentification/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Wrapper(),
            theme: MyThemes().lightTheme,
            darkTheme: MyThemes().darkTheme,
            routes: routes,
          ),
        );
      },
    );
  }
}
