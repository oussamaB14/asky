import 'package:asky/models/SpaceM.dart';
import 'package:asky/views/spaces/space_item.dart';
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
    return Hero(
      tag: widget.space.spacePhoto,
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).shadowColor, width: 0.2.h),
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
            padding: EdgeInsets.all(10),
            // height: 16.5.h,
            child: Column(
              mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.space.spaceName,
                    style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.headline2,
                        fontSize: 2.h)),
                Image.asset('assets/images/${widget.space.spacePhoto}'),
                // SizedBox(height: 1.h),
                // Text(widget.space.spaceName,
                //     style: TextStyle(
                //       fontSize: 1.5.h,
                //       fontWeight: FontWeight.bold,
                //     )),
                SizedBox(height: 1.h),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(30),
                //   child: RawChip(
                //     deleteIcon: Icon(Icons.plus_one),
                //     label: Text('Join'),
                //     selected: isSelected,
                //     padding: const EdgeInsets.symmetric(horizontal: 2),
                //     // labelPadding: const EdgeInsets.symmetric(vertical :2.0),
                //     onSelected: (newBoolValue) {
                //       setState(() {
                //         isSelected = newBoolValue;
                //       });
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
