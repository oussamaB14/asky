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
        body: Card(
          color: AdminColors.white,
          child: DataTable(
            border: TableBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'user name ',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'title ',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'content',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text(
                    'Sarah',
                    style: TextStyle(fontSize: 8.sp),
                  )),
                  DataCell(Text(
                    '19',
                    style: TextStyle(fontSize: 8.sp),
                  )),
                  DataCell(Text(
                    'Student',
                    style: TextStyle(fontSize: 8.sp),
                  )),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text(
                    'Janine',
                    style: TextStyle(fontSize: 8.sp),
                  )),
                  DataCell(Text(
                    '43',
                    style: TextStyle(fontSize: 8.sp),
                  )),
                  DataCell(Text(
                    'Professor',
                    style: TextStyle(fontSize: 8.sp),
                  )),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text(
                    'William',
                    style: TextStyle(fontSize: 8.sp),
                  )),
                  DataCell(Text(
                    '27',
                    style: TextStyle(fontSize: 8.sp),
                  )),
                  DataCell(Text(
                    'Associate Professor',
                    style: TextStyle(fontSize: 8.sp),
                  )),
                ],
              ),
            ],
          ),
        ));
  }
}
