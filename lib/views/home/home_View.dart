import 'package:asky/models/Polls.dart';
import 'package:asky/models/Question.dart';
import 'package:asky/services/QuestionsService.dart';
import 'package:asky/views/polls/PollsCard.dart';
import 'package:asky/widgets/Poll_card.dart';
import 'package:asky/widgets/ask_card.dart';
import 'package:asky/widgets/join_space_card.dart';
import 'package:asky/widgets/quize_card.dart';
import 'package:asky/widgets/in_app_drawer.dart';
import 'package:asky/widgets/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../QuestionViews/widgets/QuestionButton.dart';
import '../QuestionViews/widgets/QuestionCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  final QuestionsServices _questionsServices = QuestionsServices();
  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        // leading: CircleAvatar(
        //     backgroundColor: Colors.transparent,
        //     radius: 3.h,
        //     child: Image.asset('assets/images/applogo.png', height: 3.5.h)),
        title: Text('Asky',
            style: GoogleFonts.k2d(
                textStyle: Theme.of(context).textTheme.headline3)),
        iconTheme: IconThemeData(
            color: isDarkTheme
                ? const Color(0xFF2cb67d)
                : const Color(0xFF7f5af0)),
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: 'Questions',
            ),
            Tab(
              text: 'Polls',
            ),
          ],
          indicatorColor:
              isDarkTheme ? const Color(0xFF2cb67d) : const Color(0xFF7f5af0),
          // indicator: const UnderlineTabIndicator(
          //     borderSide: BorderSide(width: 2.0),
          //     insets: EdgeInsets.symmetric(horizontal: 16.0)),
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 18.0),
        ),
      ),
      ///////////////////////////////---------------APPDRAWER-----------//////////////////////////////
      endDrawer: SafeArea(
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: const EdgeInsets.all(15),
            height: 27.h,
            child: const AppDrawer(),
          ),
        ),
      ),
      floatingActionButton: const questionButton(),
      // body: NestedScrollView(
      //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      //     return <Widget>[
      //       SliverAppBar(
      //         title: Text('Asky',
      //             style: GoogleFonts.k2d(
      //                 textStyle: Theme.of(context).textTheme.headline3)),
      //         pinned: true,
      //         floating: true,
      //         iconTheme: IconThemeData(
      //             color: isDarkTheme
      //                 ? const Color(0xFF2cb67d)
      //                 : const Color(0xFF7f5af0)),
      //         forceElevated: innerBoxIsScrolled,
      //         bottom: TabBar(
      //           controller: _tabController,
      //           tabs: const <Widget>[
      //             Tab(
      //               text: 'Questions',
      //             ),
      //             Tab(
      //               text: 'Polls',
      //             ),
      //           ],
      //           indicatorColor: isDarkTheme
      //               ? const Color(0xFF2cb67d)
      //               : const Color(0xFF7f5af0),
      //           // indicator: const UnderlineTabIndicator(
      //           //     borderSide: BorderSide(width: 2.0),
      //           //     insets: EdgeInsets.symmetric(horizontal: 16.0)),
      //           indicatorPadding:
      //               const EdgeInsets.symmetric(horizontal: 18.0),
      //         ),
      //       ),
      //     ];
      //   },
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Quick start',
                        style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline2)),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            MyQuizCard(),
                            const MySpaceCard(),
                            const CreateCard(),
                            const MyAskcard()
                          ],
                        )),
                    Text('Questions',
                        style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline1)),
                    FutureBuilder<List<Question>>(
                        future: _questionsServices.getAllQuestions(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return const Center(
                                child: MainLoadinger(),
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
                  ]),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Quick start',
                      style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.headline2)),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          MyQuizCard(),
                          const MySpaceCard(),
                          const CreateCard(),
                          const MyAskcard()
                        ],
                      )),
                  Text('Polls',
                      style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.headline1)),
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('polls')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(child: MainLoadinger());
                        }
                        if (!snapshot.hasData) {
                          return const Text('no data');
                        }

                        var data = snapshot.data?.docs;

                        if (data == null) {
                          return const Text('Null');
                        }

                        if (data.length == null) {
                          return const Text('Null');
                        }

                        return Column(children: [
                          for (int i = 0; i < data.length; i++)
                            PollCard(
                              poll: PollsModel(
                                  username: data[i]['username'],
                                  userPhoto: data[i]['userPhoto'],
                                  question: data[i]['question'],
                                  authorId: data[i]['authorId'],
                                  options: data[i]['options']),
                              id: data[i].id,
                            )
                        ]);
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//  SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Quick start',
//                   style: GoogleFonts.lato(
//                       textStyle: Theme.of(context).textTheme.headline2)),
//               SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       MyQuizCard(),
//                       const MySpaceCard(),
//                       const CreateCard(),
//                       const MyAskcard()
//                     ],
//                   )),
//               Text('Polls',
//                   style: GoogleFonts.lato(
//                       textStyle: Theme.of(context).textTheme.headline1)),
//               StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('polls')
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(child: MainLoadinger());
//                     }
//                     if (!snapshot.hasData) {
//                       return const Text('');
//                     }

//                     var data = snapshot.data?.docs;

//                     if (data == null) {
//                       return const Text('Null');
//                     }

//                     if (data.length == null) {
//                       return const Text('Null');
//                     }

//                     return Column(children: [
//                       for (int i = 0; i < data.length; i++)
//                         PollCard(
//                           poll: PollsModel(
//                               username: data[i]['username'],
//                               userPhoto: data[i]['userPhoto'],
//                               question: data[i]['question'],
//                               authorId: data[i]['authorId'],
//                               options: data[i]['options']),
//                           id: data[i].id,
//                         )
//                     ]);
//                   }),
//               Text('Questions',
//                   style: GoogleFonts.lato(
//                       textStyle: Theme.of(context).textTheme.headline1)),
//               FutureBuilder<List<Question>>(
//                   future: _questionsServices.getAllQuestions(),
//                   builder: (context, snapshot) {
//                     switch (snapshot.connectionState) {
//                       case ConnectionState.waiting:
//                         return const Center(
//                           child: MainLoadinger(),
//                         );
//                       case ConnectionState.done:
//                         return Column(
//                             children: List.generate(
//                                 snapshot.data!.length,
//                                 (index) => QuestionCard(
//                                     question: snapshot.data![index])));
//                       default:
//                         return const Text("Error");
//                     }
//                   }),
//             ],
//           ),
//         ),
//       ),