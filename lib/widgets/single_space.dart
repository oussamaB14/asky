import 'package:asky/services/SpaceService.dart';
import 'package:asky/views/Quizzes/error.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../models/SpaceM.dart';

class Singlecard extends StatelessWidget {
  const Singlecard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Space>>(
        future: SpaceService().getSpaces(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return ErrorMessage(message: snapshot.error.toString());
          } else if (snapshot.hasData) {
            var spaces = snapshot.data;
            return ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: SizedBox(
                width: 15.h,
                height: 18.h,
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('spaceName',
                                style: GoogleFonts.lato(
                                    textStyle:
                                        Theme.of(context).textTheme.headline1,
                                    fontSize: 2.h)),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/spaces');
                              },
                              child: Icon(
                                Icons.arrow_forward,
                                size: 3.5.h,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Stack(fit: StackFit.passthrough, children: [
                          Positioned(
                              child: Image.asset('assets/images/space.png')),
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Text('No topics found in Firestore. Check database');
          }
        });
  }
}
