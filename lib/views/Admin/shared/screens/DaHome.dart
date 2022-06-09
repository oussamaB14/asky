import 'package:asky/views/Admin/shared/DaAppBar.dart';
import 'package:asky/views/Admin/shared/DashboardColors.dart';
import 'package:asky/views/Admin/shared/cards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../DaAppBar.dart';
import '../DashboardColors.dart';
import '../DashboardDrawer.dart';

class DaHome extends StatelessWidget {
  const DaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdminColors.backgroundColor,
      appBar: const DaAppBar(
        title: 'Dashboard',
      ),
      drawer: const DashboardDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Admin\nWelcome to your dashboard',
                    style: GoogleFonts.overpass(
                        textStyle: Theme.of(context).textTheme.headline2,
                        fontSize: 5.sp,
                        color: AdminColors.white),
                  ),
                  Row(
                    children: [
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('questions')
                              .snapshots(),
                          builder: (context, snap) {
                            if (snap.connectionState ==
                                ConnectionState.waiting) {
                              return Text('');
                            }

                            if (!snap.hasData) {
                              return Text('');
                            }

                            var data = snap.data;
                            int nbQuestions = 0;
                            int nbAnswers = 0;
                            for (int i = 0; i < data!.docs.length; i++) {
                              nbQuestions++;

                              List<dynamic> answers = data.docs[i]['anwsers'];

                              answers.forEach((element) {
                                nbAnswers++;
                              });
                            }
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyDashboardcard(
                                  color: AdminColors.green,
                                  title: 'Questions',
                                  icon: Icon(
                                    TernavIcons.lightOutline.qustion,
                                    color: AdminColors.white,
                                    size: 30,
                                  ),
                                  nbr: nbQuestions,
                                ),
                                MyDashboardcard(
                                  color: AdminColors.purple,
                                  title: 'Anwsers',
                                  icon: Icon(
                                    CommunityMaterialIcons.chat_outline,
                                    color: AdminColors.white,
                                    size: 30,
                                  ),
                                  nbr: nbAnswers,
                                ),
                              ],
                            );
                          }),
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('polls')
                              .snapshots(),
                          builder: (context, snap) {
                            if (snap.connectionState ==
                                ConnectionState.waiting) {
                              return Text('');
                            }

                            if (!snap.hasData) {
                              return Text('');
                            }

                            var data = snap.data;
                            int nbPolls = 0;
                            for (int i = 0; i < data!.docs.length; i++) {
                              nbPolls++;
                            }
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyDashboardcard(
                                  color: AdminColors.yellow,
                                  title: 'Polls',
                                  icon: Icon(
                                    CommunityMaterialIcons.poll,
                                    color: AdminColors.white,
                                    size: 30,
                                  ),
                                  nbr: nbPolls,
                                ),
                              ],
                            );
                          }),
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('user')
                              .snapshots(),
                          builder: (context, snap) {
                            if (snap.connectionState ==
                                ConnectionState.waiting) {
                              return Text('');
                            }
                            if (!snap.hasData) {
                              return Text('');
                            }
                            var data = snap.data;
                            int nbusers = 0;
                            for (int i = 0; i < data!.docs.length; i++) {
                              nbusers++;
                            }
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyDashboardcard(
                                  color: AdminColors.pink,
                                  title: 'Usres',
                                  icon: Icon(
                                    CommunityMaterialIcons.account,
                                    color: AdminColors.white,
                                    size: 30,
                                  ),
                                  nbr: nbusers,
                                ),
                              ],
                            );
                          }),
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('space')
                              .snapshots(),
                          builder: (context, snap) {
                            if (snap.connectionState ==
                                ConnectionState.waiting) {
                              return Text('');
                            }
                            if (!snap.hasData) {
                              return Text('');
                            }
                            var data = snap.data;
                            int nbspaces = 0;
                            for (int i = 0; i < data!.docs.length; i++) {
                              nbspaces++;
                            }
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyDashboardcard(
                                  color: AdminColors.pink,
                                  title: 'Spaces',
                                  icon: Icon(
                                    TernavIcons.lightOutline.chat,
                                    color: AdminColors.white,
                                    size: 30,
                                  ),
                                  nbr: nbspaces,
                                ),
                              ],
                            );
                          }),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
