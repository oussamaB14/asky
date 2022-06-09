import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

import '../DaAppBar.dart';
import '../DashboardColors.dart';
import '../DashboardDrawer.dart';

class DaUsers extends StatelessWidget {
  const DaUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AdminColors.backgroundColor,
        appBar: const DaAppBar(title: 'Users'),
        drawer: const DashboardDrawer(),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Card(
                color: AdminColors.white,
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('user')
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
                            label: Text('Edmail',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Role',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Education filed',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Delete',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ], rows: <DataRow>[
                        if (data != null)
                          for (int i = 0; i < data.length; i++)
                            DataRow(cells: [
                              DataCell(Text(data[i]['name'],
                                  style: TextStyle(fontSize: 4.sp))),
                              DataCell(Text(data[i]['email'],
                                  style: TextStyle(fontSize: 4.sp))),
                              DataCell(Text(data[i]['role'],
                                  style: TextStyle(fontSize: 4.sp))),
                              DataCell(Text(data[i]['educationFiled'],
                                  style: TextStyle(fontSize: 4.sp))),
                              DataCell(TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('user')
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
