import 'package:asky/styles/colors.dart';
import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'),

        // actions: [BackButton(onPressed: (){},)],
      ),
    );
  }
}
