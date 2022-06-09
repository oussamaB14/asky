import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Card(
                  color: AdminColors.white,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('polls')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) return const Text('Error');
                        var data = snapshot.data?.docs;
                        return DataTable(columns: const [
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Option')),
                          // DataColumn(label: Text('content')),
                          DataColumn(label: Text('Delete')),
                        ], rows: <DataRow>[
                          if (data != null)
                            for (int i = 0; i < data.length; i++)
                              DataRow(cells: [
                                DataCell(Text(data[i]['username'],
                                    style: TextStyle(fontSize: 4.sp))),
                                DataCell(Text(data[i]['options'].toString(),
                                    style: TextStyle(fontSize: 4.sp))),
                                // DataCell(Text(data[i]['content'],
                                //     style: TextStyle(fontSize: 4.sp))),
                                DataCell(TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red)),
                                    onPressed: () {},
                                    child: const Icon(Icons.delete,
                                        color: Colors.white))),
                              ])
                        ]);
                      })),
            ),
          ),
        ));
  }
}
