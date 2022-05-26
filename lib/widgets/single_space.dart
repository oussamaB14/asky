import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Singlecard extends StatelessWidget {
  const Singlecard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        width: 46.h,
        height: 18.h,
        child: Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 70,
                        child: Image.asset('assets/images/space.png')),
                    const SizedBox(
                      width: 25,
                    ),
                    Text('Note',
                        style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.headline1,
                            fontSize: 3.h)),
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
                // Stack(fit: StackFit.passthrough, children: [
                //   Positioned(
                //       child: Image.asset('assets/images/space.png')),
                // ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
