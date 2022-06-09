import 'package:asky/views/Admin/shared/DaAppBar.dart';
import 'package:asky/views/Admin/shared/DashboardColors.dart';
import 'package:asky/views/Admin/shared/DashboardDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../services/AnwserService.dart';

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
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Card(
                color: AdminColors.white,
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('questions')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) return const Text('Error');
                      if (!snapshot.hasData) {
                        return const Text('No asnwers');
                      }
                      var data = snapshot.data?.docs;
                      return DataTable(columns: const [
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('answer')),
                        DataColumn(label: Text('Delete')),
                      ], rows: <DataRow>[
                        for (int i = 0; i < data!.length; i++)
                          for (int j = 0; j < data[i]['anwsers'].length; j++)
                            DataRow(cells: [
                              DataCell(Text(data[i]['anwsers'][j]['username'],
                                  style: TextStyle(fontSize: 4.sp))),
                              DataCell(Text(data[i]['anwsers'][j]['answer'],
                                  style: TextStyle(fontSize: 4.sp))),
                              DataCell(TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                  onPressed: () {
                                    AnwserService().deleteAnswser(
                                        data[i]['anwsers'][j]['parentDocId'],
                                        data[i]['anwsers'][j]['id']);
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ))),
                            ])
                      ]);
                    })),
          ),
        ));
  }
}
