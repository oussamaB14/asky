import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../DaAppBar.dart';
import '../DashboardColors.dart';
import '../DashboardDrawer.dart';

class DaQuestions extends StatelessWidget {
  const DaQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AdminColors.backgroundColor,
        appBar: const DaAppBar(
          title: 'Questions',
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
                      var data = snapshot.data?.docs;
                      return DataTable(columns: const [
                        DataColumn(
                            label: Text('Name',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('titile',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('content',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Delete',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ], rows: <DataRow>[
                        if (data != null)
                          for (int i = 0; i < data.length; i++)
                            DataRow(cells: [
                              DataCell(Text(data[i]['username'],
                                  style: TextStyle(fontSize: 4.sp))),
                              DataCell(Text(data[i]['title'],
                                  style: TextStyle(fontSize: 4.sp))),
                              DataCell(Text(data[i]['content'],
                                  style: TextStyle(fontSize: 4.sp))),
                              DataCell(TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors.red)),
                                  onPressed: () {
                                     FirebaseFirestore.instance
                                        .collection('questions')
                                        .doc(data[i].id)
                                        .delete();
                                  },
                                  child: const Icon(Icons.delete,
                                      color: Colors.white))),
                            ])
                      ]);
                    })),
          ),
        ));
  }
}
