import 'package:asky/views/Admin/shared/DaAppBar.dart';
import 'package:asky/views/Admin/shared/DashboardColors.dart';
import 'package:asky/views/Admin/shared/DashboardDrawer.dart';
import 'package:flutter/material.dart';

class DaAnwsers extends StatelessWidget {
  const DaAnwsers({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdminColors.backgroundColor,
      appBar: const DaAppBar(
        title: 'Anwsers',
      ),
      drawer: const DashboardDrawer(),
      body: Column(
        children: [Text('anwsers')],
      ),
    );
  }
}
