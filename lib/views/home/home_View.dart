import 'package:asky/models/Question.dart';
import 'package:asky/models/user.dart';
import 'package:asky/services/QuestionsService.dart';
import 'package:asky/services/user_service.dart';
import 'package:asky/styles/colors.dart';
import 'package:asky/views/spaces/widgets/quize_card.dart';
import 'package:asky/widgets/in_app_drawer.dart';
import 'package:asky/widgets/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../QuestionViews/Questions_view.dart';
import '../QuestionViews/widgets/QuestionButton.dart';
import '../QuestionViews/widgets/QuestionCard.dart';

class HomePage extends StatefulWidget {
  final profileId;
  const HomePage({Key? key, this.profileId}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePage> {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  late final profileId;
  QuestionsServices _questionsServices = QuestionsServices();
  @override
  Widget build(BuildContext context) {
    AppBarTheme appBarTheme = Theme.of(context).appBarTheme;
    return Scaffold(
      appBar: AppBar(
        // title: Text('home'),

        automaticallyImplyLeading: false,
      ),
      endDrawer: SafeArea(
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: const EdgeInsets.all(15),
            height: 28.h,
            child: const AppDrawer(),
          ),
        ),
      ),
      floatingActionButton: const questionButton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Text('Home',
              //     style: GoogleFonts.lato(
              //         textStyle: Theme.of(context).textTheme.headline1)),
              FutureBuilder<List<Question>>(
                  future: _questionsServices.getAllQuestions(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(
                          child: MainLoadingScreen(),
                        );
                      case ConnectionState.done:
                        return Column(
                            children: List.generate(
                                snapshot.data!.length,
                                (index) => QuestionCard(
                                    question: snapshot.data![index])));
                      default:
                        return const Text("Error");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
