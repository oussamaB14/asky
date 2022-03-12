import 'package:firebase_core/firebase_core.dart';
import 'package:asky/routes.dart';
import 'package:asky/styles/theme.dart';
import 'package:asky/views/Wrapper.dart';
import 'package:asky/views/authentification/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Runner extends StatelessWidget {
  const Runner({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WelcomePage(),
          theme: MyThemes().lightTheme,
          darkTheme: MyThemes().darkTheme,
          routes: routes,
        );
      },
    );
  }
}
