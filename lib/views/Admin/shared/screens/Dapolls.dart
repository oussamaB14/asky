import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../DaAppBar.dart';
import '../DashboardColors.dart';
import '../DashboardDrawer.dart';

class DaPolls extends StatefulWidget {
  const DaPolls({Key? key}) : super(key: key);

  @override
  State<DaPolls> createState() => _DaPollsState();
}

class _DaPollsState extends State<DaPolls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdminColors.backgroundColor,
      appBar: const DaAppBar(title: 'Polls'),
      drawer: const DashboardDrawer(),
      body: const Text('polls'),
    );
  }
}
