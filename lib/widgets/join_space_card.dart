import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MySpaceCard extends StatefulWidget {
  const MySpaceCard({Key? key}) : super(key: key);

  @override
  State<MySpaceCard> createState() => _MySpaceCardState();
}

class _MySpaceCardState extends State<MySpaceCard> {
  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        width: 15.h,
        height: 18.h,
        child: Card(
          color: isDarkTheme ? Color(0xFF2cb67d) : Theme.of(context).cardColor,
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Join a \nSpace',
                        style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline1,
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
                  Positioned(child: Image.asset('assets/images/space.png')),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
