import 'package:asky/models/Anwser.dart';
import 'package:asky/views/AnwserView/widgets/Anwser_menu.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AnwserCard extends StatelessWidget {
  final Map<String, dynamic> anwser; // ['']
  const AnwserCard({Key? key, required this.anwser}) : super(key: key);

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
                  backgroundImage: NetworkImage(anwser['imgUrl']),
                ),
                SizedBox(width: 2.h),
                Text(anwser['username']),
                const Spacer(),
                const AnwserPopMenu(),
              ],
            ),
            SizedBox(height: 1.5.h),
            Text(
              anwser['answer'],
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
