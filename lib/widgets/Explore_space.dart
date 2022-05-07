import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../models/SpaceM.dart';

class ExploreSpaceCaerd extends StatefulWidget {
  const ExploreSpaceCaerd({Key? key, required this.space}) : super(key: key);
    final Space space;

  @override
  State<ExploreSpaceCaerd> createState() => _ExploreSpaceCaerdState();
}

class _ExploreSpaceCaerdState extends State<ExploreSpaceCaerd> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 10.h,
        child: Card(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/${widget.space.spacePhoto}',
                  width: 7.5.h),
                  Text(widget.space.spaceName,
                    style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.headline2,
                        fontSize: 2.h),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
