import 'package:flutter/material.dart';

import 'DaAppBar.dart';
import 'DashboardColors.dart';
import 'DashboardDrawer.dart';

class DaQuestions extends StatelessWidget {
  const DaQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdminColors.backgroundColor,
      appBar: const DaAppBar(title: 'Questions',),
      drawer: const DashboardDrawer(),
      body: Column(
        children: const [Text('Questions')],
      ),
    );
  }
}
