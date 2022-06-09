import 'package:asky/views/Quizzes/error.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../widgets/loading.dart';
import '../DaAppBar.dart';
import '../DashboardColors.dart';
import '../DashboardDrawer.dart';

class DaSpaces extends StatelessWidget {
  const DaSpaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AdminColors.backgroundColor,
        appBar: const DaAppBar(title: 'Spaces'),
        drawer: const DashboardDrawer(),
        body: Card(
            color: AdminColors.white,
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('space').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const MainLoadinger();
                } else if (snapshot.hasError) {
                  return ErrorMessage(message: snapshot.error.toString());
                } else if (snapshot.hasData) {
                  //var spaces = snapshot.data!.docs;
                  var data = snapshot.data?.docs;
                  return Card(
                      color: Colors.grey.shade100,
                      child: DataTable(columns: const [
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('answer')),
                        DataColumn(label: Text('Delete')),
                      ], rows: <DataRow>[
                        for (int i = 0; i < data!.length; i++)
                          //for (int j = 0; j < data[i]['anwsers'].length; j++)
                          DataRow(cells: [
                            DataCell(Text(data[i]['spaceName'],
                                style: TextStyle(fontSize: 4.sp))),
                            DataCell(Text(data[i]['description'],
                                style: TextStyle(fontSize: 4.sp))),
                            DataCell(TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red)),
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('space')
                                      .doc(data[i].id)
                                      .delete();
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ))),
                          ])
                      ]));

                  /*DataTable(columns: const [
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Description')),
                        DataColumn(label: Text('Delete')),
                      ], rows: <DataRow>[
                        for (int i = 0; i < spaces.length; i++)
                          DataRow(cells: [
                            DataCell(Text(spaces[i]['spaceName'],
                                style: TextStyle(fontSize: 4.sp))),
                            DataCell(Text(spaces[i]['description'],
                                style: TextStyle(fontSize: 4.sp))),
                            DataCell(TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red)),
                                onPressed: () {},
                                child: const Icon(Icons.delete,
                                    color: Colors.white))),
                          ])
                      ]));*/
                } else {
                  return const Text(
                      'No topics found in Firestore. Check database');
                }
              },
            )));
  }
}
