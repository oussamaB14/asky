import 'package:asky/models/SpaceM.dart';
import 'package:asky/styles/colors.dart';
import 'package:asky/views/Quizzes/topic_item.dart';
import 'package:asky/views/spaces/space_item.dart';
import 'package:asky/views/spaces/widgets/addSpaceButton.dart';
import 'package:asky/views/spaces/widgets/space_card.dart';
import 'package:asky/widgets/in_app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../services/SpaceService.dart';
import '../../widgets/loading.dart';
import '../Quizzes/error.dart';

class SpacesScreen extends StatelessWidget {
  const SpacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return FutureBuilder<List<Space>>(
      future: SpaceService().getSpaces(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MainLoadinger();
        } else if (snapshot.hasError) {
          return ErrorMessage(message: snapshot.error.toString());
        } else if (snapshot.hasData) {
          var spaces = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Spaces'),
              automaticallyImplyLeading: false,
            ),
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
            floatingActionButton: spaceButton(),
            body: Container(
              color: isDarkTheme ? MyColors.black : Colors.white,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children:
                    spaces.map((space) => SpaceCard(space: space)).toList(),
              ),
            ),
            // bottomNavigationBar: const BottomNavBar(),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('No topics found in Firestore. Check database'),
            ),
          );
        }
      },
    );
  }
}
