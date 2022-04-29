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
import 'package:asky/views/profile/widgets/Settings_view.dart';
import 'package:asky/views/profile/widgets/Bookmarks_view.dart';
import 'package:asky/views/profile/widgets/EditProfile_view.dart';
import 'package:asky/views/profile/widgets/MySpaces_view.dart';

import 'package:asky/views/profile/profile.dart';
import 'package:asky/views/spaces/spaces.dart';
import 'package:asky/views/spaces/widgets/AddSpace.dart';
import 'package:flutter/widgets.dart';

import 'views/authentification/registration/registrationtest.dart';

final Map<String, WidgetBuilder> routes = {
  // // "/welcomePage": (context) => Wrapper(),
  // "/StudentProfile": (context) => StudentProfile(),
  "/spaces": (context) => const SpacesScreen(),
  // "/explore": (context) => const Explore(),
  "/signin": (context) => const SigninView(),
  "/signup": (context) => const SignupView(),
  "/homepage": ((context) => Wrapper()),
  'Welcomepage': (context) => const WelcomePage(),
  "addPost": (context) => const AddQuestionView(),
  "Settings": (context) => const SettingsScreen(),
  "MySpaces": (context) => const MySpaces(),
  "Bookmarks": (context) => const Bookmarks(),
  "EditProfile": (context) => const EditProfile(),
  '/topics': (context) => const TopicsScreen(),

  // "addanwser": (context) => AddAnwser(),
  "chatPage": (context) => const ChatPage(),
  // 'addspace': (context) => AddSpace(),
  "test": (context) => const TestReg(),
};
