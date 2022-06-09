import 'package:asky/models/SpaceM.dart';
import 'package:asky/views/QuestionViews/widgets/QuestionCard.dart';
import 'package:asky/views/Quizzes/progress_bar.dart';
import 'package:asky/views/spaces/widgets/SpaceDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../models/Question.dart';

class SpaceItem extends StatelessWidget {
  final Space space;

  const SpaceItem({Key? key, required this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: space.spacePhoto,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => SpaceScreen(space: space),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 3,
                child: SizedBox(
                  child: Image.asset(
                    'assets/covers/${space.spacePhoto}',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      space.spaceName,
                      style: const TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    )),
              ),
              // Flexible(child: SpaceProgress(Space: Space)),
            ],
          ),
        ),
      ),
    );
  }
}

class SpaceScreen extends StatefulWidget {
  final Space space;
  const SpaceScreen({Key? key, required this.space}) : super(key: key);

  @override
  State<SpaceScreen> createState() => _SpaceScreenState();
}

class _SpaceScreenState extends State<SpaceScreen> {
  bool isVisible = false;
  bool tagVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.space.spaceName),
      ),
      endDrawer: SafeArea(
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: EdgeInsets.all(15),
            height: 25.h,
            child: SpaceDrawer(),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/${widget.space.spacePhoto}'),
                    Text(
                        'Here you can find Questions and \nAnwsers about ${widget.space.spaceName} ')
                  ],
                ),
              ),
              Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ExpansionTile(
                    title: const Text('Description :'),
                    // backgroundColor: Theme.of(context).cardColor,
                    leading:
                        const Icon(CommunityMaterialIcons.chat_alert_outline),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.space.description),
                      )
                    ],
                  ),
                ),
              ),
              ////////////////////st-re-----------////////////////////
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('questions')
                      .where('tags', arrayContains: widget.space.spaceName)
                      .snapshots(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (!snapshot.hasData) {
                      return const Text('Error');
                    }

                    var docs = snapshot.data!.docs;
                    return Column(children: [
                      for (int i = 0; i < docs.length; i++)
                        QuestionCard(
                          question: Question(
                              username: docs[i]['username'],
                              userPhoto: docs[i]['userPhoto'],
                              title: docs[i]['title'],
                              content: docs[i]['content'],
                              authorId: docs[i]['authorId'],
                              id: docs[i].id,
                              mediaUrl: docs[i]['mediaUrl'],
                              tags: docs[i]['tags'],
                              anwsers: docs[i]['anwsers']),
                        )
                    ]);
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
