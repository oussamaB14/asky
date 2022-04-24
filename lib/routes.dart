import 'package:asky/views/AnwserView/AddAnwserView.dart';
import 'package:asky/views/QuestionViews/AddQuestionView.dart';
import 'package:asky/views/Quizzes/topics.dart';
import 'package:asky/views/Wrapper.dart';
import 'package:asky/views/authentification/signin_view.dart';
import 'package:asky/views/authentification/signup_view.dart';
import 'package:asky/views/authentification/welcome_view.dart';
import 'package:asky/views/chat/chat_view.dart';
import 'package:asky/views/explore/explore_view.dart';
import 'package:asky/views/home/home_View.dart';
import 'package:asky/views/profile/Settings_view.dart';
import 'package:asky/views/profile/widgets/Bookmarks_view.dart';
import 'package:asky/views/profile/widgets/EditProfile_view.dart';
import 'package:asky/views/profile/widgets/MySpaces_view.dart';

import 'package:asky/views/profile/student_profile.dart';
import 'package:asky/views/registration/registrationtest.dart';

import 'package:asky/views/registration/student_view.dart';
import 'package:asky/views/spaces/widgets/AddSpace.dart';
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
  '/topics': (context) => TopicsScreen(),
  "addanwser": (context) => AddAnwser(),
  "chatPage": (context) => ChatPage(),
  'addspace': (context) => AddSpace(),
  "test":(context) => TestReg(),
};
