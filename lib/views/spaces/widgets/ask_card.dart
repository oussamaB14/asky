import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MyAskcard extends StatelessWidget {
  const MyAskcard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        width: 15.h,
        height: 18.h,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Ask a \nQuestion',
                        style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline1,
                            fontSize: 2.h)),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('addPost');
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
                    child: Image.asset('assets/images/question.png',width: 8.h,),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
