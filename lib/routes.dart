
import 'package:asky/views/Admin/shared/screens/DaAnwsers.dart';
import 'package:asky/views/Admin/shared/screens/DaHome.dart';
import 'package:asky/views/Admin/shared/screens/DaQuestions.dart';
import 'package:asky/views/Admin/shared/screens/DaSettings.dart';
import 'package:asky/views/Admin/shared/screens/DaSpaces.dart';
import 'package:asky/views/Admin/shared/screens/DaTags.dart';
import 'package:asky/views/Admin/shared/screens/Dapolls.dart';
import 'package:asky/views/Admin/shared/screens/Daquizes.dart';
import 'package:asky/views/Admin/shared/screens/Dausers.dart';
import 'package:asky/views/QuestionViews/AddQuestionView.dart';
import 'package:asky/views/Quizzes/topics.dart';
import 'package:asky/views/Wrapper.dart';
import 'package:asky/views/authentification/signin_view.dart';
import 'package:asky/views/authentification/signup_view.dart';
import 'package:asky/views/authentification/welcome_view.dart';
import 'package:asky/views/chat/chat_view.dart';
import 'package:asky/views/polls/addPoll.dart';
import 'package:asky/views/profile/widgets/Settings_view.dart';
import 'package:asky/views/profile/widgets/Bookmarks_view.dart';
import 'package:asky/views/profile/widgets/EditProfile_view.dart';
import 'package:asky/views/profile/widgets/MySpaces_view.dart';

import 'package:asky/views/profile/profile.dart';
import 'package:asky/views/spaces/spaces.dart';
import 'package:asky/views/spaces/widgets/AddSpace.dart';
import 'package:flutter/widgets.dart';

import 'views/authentification/registration/registration.dart';

final Map<String, WidgetBuilder> routes = {
  "/StudentProfile": (context) => StudentProfile(),
  "/spaces": (context) => const SpacesScreen(),
  "/signin": (context) => const SigninView(),
  "/signup": (context) => const SignupView(),
  "/homepage": ((context) => Wrapper()),
  'Welcomepage': (context) => const WelcomePage(),
  "addPost": (context) => AddQuestionView(),
  "Settings": (context) => const SettingsScreen(),
  "MySpaces": (context) => const MySpaces(),
  "Bookmarks": (context) => const Bookmarks(),
  "EditProfile": (context) => const EditProfile(),
  '/topics': (context) => const TopicsScreen(),
  "addPoll": (context) => const AddPoll(),
  // "addanwser": (context) => AddAnwser(),
  "chatPage": (context) => const ChatPage(),
  'addspace': (context) => const AddSpace(),
  "test": (context) => const RegestrationView(),
  "Dahome": (context) => const DaHome(),
  "DaQuestion": (context) => const DaQuestions(),
  "Datags": (context) => const DaTags(),
  "DaPolls": (context) => const DaPolls(),
  "DaSettings": (context) => const DaSettings(),
  "DaSpaces": (context) => const DaSpaces(),
  "DaAnwsers": (context) => const DaAnwsers(),
  "DaUsers": (context) => const DaUsers(),
  "DaQuizzes": (context) => const DaQuizzes(),
};
