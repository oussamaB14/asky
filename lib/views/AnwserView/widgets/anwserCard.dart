import 'package:asky/models/Anwser.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AnwserCard extends StatelessWidget {
  const AnwserCard({Key? key, required this.anwser}) : super(key: key);
  final Anwser anwser;

//   @override
//   State<AnwserCard> createState() => _AnwserCardState();
// }

// class _AnwserCardState extends State<AnwserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.brown.shade800,
                  child: const Text('AH'),
                ),
                SizedBox(width: 2.h),
                Text("username"),
              ],
            ),
            SizedBox(height: 1.5.h),
            Text(
              anwser.awnser,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Row(
              children: [
                // GestureDetector(
                //   onTap: () {
                //     // setState(() {
                //     //   saved = !saved;
                //     // });
                //   },
                //   // child: Icon(saved ? Icons.bookmark : Icons.bookmark_outline),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
