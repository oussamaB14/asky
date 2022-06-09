import 'package:asky/models/SpaceM.dart';
import 'package:asky/views/spaces/space_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SpaceTable extends StatefulWidget {
  const SpaceTable({Key? key, required this.space}) : super(key: key);
  final Space space;

  @override
  State<SpaceTable> createState() => _SpaceTableState();
}

class _SpaceTableState extends State<SpaceTable> {
//   @override
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Card(
        color: Colors.grey.shade100,
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: Theme.of(context).shadowColor, width: 0.2.h),
          borderRadius: BorderRadius.circular(40),
        ),
        child: DataTable(columns: const [
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Description')),
          DataColumn(label: Text('Delete')),
        ], rows: <DataRow>[
          DataRow(cells: [
            DataCell(
                Text(widget.space.spaceName, style: TextStyle(fontSize: 4.sp))),
            DataCell(Text(widget.space.description,
                style: TextStyle(fontSize: 4.sp))),
            DataCell(TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () {},
                child: const Icon(Icons.delete, color: Colors.white))),
          ])
        ]));
  }
}
