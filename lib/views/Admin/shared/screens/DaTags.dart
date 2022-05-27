import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../DaAppBar.dart';
import '../DashboardColors.dart';
import '../DashboardDrawer.dart';

class DaTags extends StatelessWidget {
  const DaTags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdminColors.backgroundColor,
      appBar: const DaAppBar(title: 'Tags'),
      drawer: const DashboardDrawer(),
      body: const Text('polls'),
    );
  }
}
