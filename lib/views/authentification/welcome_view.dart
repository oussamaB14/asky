import 'package:carousel_slider/carousel_slider.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            // padding: const EdgeInsets.only(left : 20.0, right : 20.0)
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height:20.5.h),
                CarouselSlider(
                    items: [
                      Image.asset('assets/images/plan.png', height: 50.h),
                      Image.asset('assets/images/plan2.png', height: 50.h),
                      Image.asset('assets/images/plan1.png', height: 50.h),
                      Image.asset('assets/images/LOGO.png', height: 50.h),
                    ],
                    options: CarouselOptions(
                      // height: 35.h,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      // onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    )),
                SizedBox(height: 6.5.h),
                Center(
                  child: Text(
                    'welcome to Asky',
                    style: textTheme.headline1,
                  ),
                ),
                Text(
                  'Join Asky right now and live the best expirence getting knowdlege  ',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 2.5.h),
                ElevatedButton(
                  style: ButtonStyle(
                      // backgroundColor: MaterialStateProperty.all(
                      //     Color.fromARGB(255, 224, 46, 201)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ))),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/signin");
                  },
                  child: SizedBox(
                    width: 20.h,
                    height: 6.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(width: 60),
                        Center(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Expanded(
                              child: Text(
                                "Sign in",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 3.h),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 30),
                        const Icon(CommunityMaterialIcons.arrow_right_thick)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2.5.h),
                ElevatedButton(
                  style: ButtonStyle(
                      // backgroundColor: MaterialStateProperty.all(
                      //     Color.fromARGB(255, 224, 46, 201)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ))),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/signup");
                  },
                  child: SizedBox(
                    width: 20.h,
                    height: 6.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(width: 60),
                        Center(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Expanded(
                              child: Text(
                                "Sign up",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 3.h),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 30),
                        const Icon(CommunityMaterialIcons.arrow_right_thick)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
