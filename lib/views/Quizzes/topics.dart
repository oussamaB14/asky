import 'package:asky/views/Quizzes/loading.dart';
import 'package:asky/views/Quizzes/topic_item.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
import 'error.dart';
import 'firestore.dart';
import '../../widgets/loading.dart';
import 'models.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      future: FirestoreService().getTopics(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MainLoadingScreen();
        } else if (snapshot.hasError) {
          return ErrorMessage(message: snapshot.error.toString());
        } else if (snapshot.hasData) {
          var topics = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              // backgroundColor: Colors.deepPurple,
              title: const Text('Topics'),
            ),
            drawer: TopicDrawer(topics: topics),
            body: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              children: topics.map((topic) => TopicItem(topic: topic)).toList(),
            ),
            // bottomNavigationBar: const BottomNavBar(),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('No topics found in Firestore. Checl database'),
            ),
          );
        }
      },
    );
  }
}
