import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:asky/views/authentification/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        nextScreen: WelcomePage(),
        duration: 3000,
        splash: Image.asset('assets/gifs/asky1.gif', height: 50.h),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.blue
        // pageTransitionType: PageTransitionType.scale,
        );
  }
}
