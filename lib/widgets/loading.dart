import 'package:asky/constants/assets.dart';
import 'package:asky/styles/colors.dart';
import 'package:flutter/material.dart';

class MainLoadinger extends StatelessWidget {
  const MainLoadinger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Center(
      child: CircularProgressIndicator(
        color: isDarkTheme ? MyColors.green : appColor,
      ),
    );
  }
}
