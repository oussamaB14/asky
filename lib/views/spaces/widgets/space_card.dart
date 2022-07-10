import 'package:asky/models/SpaceM.dart';
import 'package:asky/views/spaces/space_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SpaceCard extends StatefulWidget {
  const SpaceCard({Key? key, required this.space}) : super(key: key);
  final Space space;

  @override
  State<SpaceCard> createState() => _SpaceCardState();
}

class _SpaceCardState extends State<SpaceCard> {
//   @override
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Hero(
      tag: widget.space.spacePhoto,
      child: Card(
        color: isDarkTheme ? Colors.black : Colors.grey.shade100,
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: Theme.of(context).shadowColor, width: 0.2.h),
          borderRadius: BorderRadius.circular(40),
        ),
        child: InkWell(
          onTap: (() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    SpaceScreen(space: widget.space),
              ),
            );
          }),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            // height: 16.5.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.space.spaceName,
                    style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.headline2,
                        fontSize: 2.h)),
                Image.asset(
                  'assets/images/${widget.space.spacePhoto}',
                  width: 7.5.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('user')
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text('');
                        }

                        if (!snapshot.hasData) {
                          return const Text('Error');
                        }

                        return RawChip(
                          avatar: Icon(
                            isSelected ? Icons.check : Icons.add,
                            color: isDarkTheme
                                ? Colors.white
                                : isSelected
                                    ? Colors.white
                                    : Colors.black,
                          ),
                          // checkmarkColor: Colors.white,
                          showCheckmark: false,
                          // selectedColor: const Color(0xFF7f5af0),
                          // disabledColor: const Color.fromARGB(255, 119, 118, 118),
                          deleteIcon: const Icon(Icons.plus_one),
                          label: snapshot.data?['Spaces']
                                  .contains(widget.space.spaceName)
                              ? const Text('Following')
                              : const Text('Follow'),
                          labelStyle: TextStyle(
                              color: isDarkTheme
                                  ? Colors.white
                                  : snapshot.data?['Spaces']
                                          .contains(widget.space.spaceName)
                                      ? Colors.white
                                      : Colors.black,
                              fontSize: 16),
                          selected: snapshot.data?['Spaces']
                              .contains(widget.space.spaceName),
                          backgroundColor:
                              isDarkTheme ? Colors.black : Colors.white,

                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          // labelPadding: const EdgeInsets.symmetric(vertical :2.0),
                          onSelected: (newBoolValue) {
                            FirebaseFirestore.instance
                                .collection('user')
                                .doc(FirebaseAuth.instance.currentUser?.uid)
                                .get()
                                .then((value) {
                              List<dynamic> spaces = value['Spaces'];
                              FirebaseFirestore.instance
                                  .collection('user')
                                  .doc(FirebaseAuth.instance.currentUser?.uid)
                                  .update({
                                'Spaces':
                                    spaces.contains(widget.space.spaceName)
                                        ? FieldValue.arrayRemove(
                                            [widget.space.spaceName])
                                        : FieldValue.arrayUnion(
                                            [widget.space.spaceName])
                              });
                            });

                            setState(() {
                              isSelected = newBoolValue;
                            });
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
