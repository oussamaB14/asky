import 'package:asky/views/authentification/signin_view.dart';
import 'package:asky/views/authentification/signup_view.dart';
import 'package:asky/views/home/home_View.dart';
import 'package:asky/views/profile/student_profile.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  "/welcomePage": (context) => HomePage(),
  "/StudentProfile": (context) => StudentProfile(),
  "/spaces": (context) => HomePage(),
  "/explore": (context) => StudentProfile(),
  "/signin": (context) => SigninView(),
  "/signup": (context) => SignupView(),
};
