import 'package:asky/views/AnwserView/AddAnwserView.dart';
import 'package:asky/views/QuestionViews/AddQuestionView.dart';
import 'package:asky/views/Wrapper.dart';
import 'package:asky/views/authentification/signin_view.dart';
import 'package:asky/views/authentification/signup_view.dart';
import 'package:asky/views/authentification/welcome_view.dart';
import 'package:asky/views/chat/chat_view.dart';
import 'package:asky/views/explore/explore_view.dart';
import 'package:asky/views/home/home_View.dart';
import 'package:asky/views/profile/Bookmarks_view.dart';
import 'package:asky/views/profile/EditProfile_view.dart';
import 'package:asky/views/profile/MySpaces_view.dart';
import 'package:asky/views/profile/Settings_view.dart';
import 'package:asky/views/profile/student_profile.dart';
import 'package:asky/views/quize/topics.dart';
import 'package:asky/views/registration/student_view.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  // "/welcomePage": (context) => Wrapper(),
  // "/StudentProfile": (context) => StudentProfile(),
  // "/spaces": (context) => Explore(),
  // "/explore": (context) => Explore(),
  "/signin": (context) => SigninView(),
  "/signup": (context) => SignupView(),
  "/homepage": ((context) => Wrapper()),
  'Welcomepage': (context) => WelcomePage(),
  "addPost": (context) => AddQuestionView(),
  'Student': (context) => Student(),
  "Settings": (context) => Settings(),
  "MySpaces": (context) => MySpaces(),
  "Bookmarks": (context) => Bookmarks(),
  "EditProfile": (context) => EditProfile(),
  '/topics': (context) => const TopicsScreen(),
  "addanwser": (context) => AddAnwser(),
  "chatPage": (context) => ChatPage()
};
