// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class FollowSpace extends StatefulWidget {
//   const FollowSpace({Key? key, required this.id}) : super(key: key);
//   final List<String> id;

//   @override
//   State<FollowSpace> createState() => _FollowSpaceState();
// }

// late final List<String> id;

// class _FollowSpaceState extends State<FollowSpace> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('user')
//             .doc(FirebaseAuth.instance.currentUser?.uid)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Text('');
//           }

//           if (!snapshot.hasData) {
//             return const Icon(Icons.bookmark_outline);
//           }

//           var data = snapshot.data;

//           List<dynamic> tab = data!['Spaces'];
//           late bool isSelected = tab.contains(id[0]) ? false : true;

//           return ClipRRect(
//             borderRadius: BorderRadius.circular(30),
//             child: RawChip(
//               avatar: Icon(isSelected ? Icons.check : Icons.add,
//                   color: isSelected ? Colors.white : Colors.black),
//               // checkmarkColor: Colors.white,
//               showCheckmark: false,
//               selectedColor: const Color(0xFF7f5af0),
//               disabledColor: const Color.fromARGB(255, 119, 118, 118),
//               deleteIcon: const Icon(Icons.plus_one),
//               label: tab.contains(id[0])
//                   ? const Text('Following')
//                   : const Text('Follow'),
//               labelStyle: TextStyle(
//                   color: isSelected ? Colors.white : Colors.black,
//                   fontSize: 16),
//               selected: isSelected,

//               padding: const EdgeInsets.symmetric(horizontal: 2),
//               // labelPadding: const EdgeInsets.symmetric(vertical :2.0),
//               onSelected: (newBoolValue) {
//                 setState(() async {
//                   isSelected = newBoolValue;
//                   await FirebaseFirestore.instance
//                       .collection('user')
//                       .doc(FirebaseAuth.instance.currentUser?.uid)
//                       .get()
//                       .then((value) async {
//                     List<dynamic> tab = value['Spaces'];
//                     await FirebaseFirestore.instance
//                         .collection('user')
//                         .doc((FirebaseAuth.instance.currentUser?.uid))
//                         .update({
//                       'Spaces': tab.contains(id[0])
//                           ? FieldValue.arrayRemove(id)
//                           : FieldValue.arrayUnion(id)
//                     });
//                   });
//                 });
//               },
//             ),
//           );
//         });
//   }
// }
