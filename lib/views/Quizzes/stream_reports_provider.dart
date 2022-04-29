// import 'package:asky/views/Quizzes/firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ReportsProvider extends StatefulWidget {
//   const ReportsProvider({ Key? key }) : super(key: key);

//   @override
//   State<ReportsProvider> createState() => _ReportsProviderState();
// }

// class _ReportsProviderState extends State<ReportsProvider> {
//    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       // Initialize FlutterFire:
//       future: _initialization,
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           return const Center(
//             child: Text(
//               'Error',
//               textDirection: TextDirection.ltr,
//             ),
//           );
//         }

//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//           return StreamProvider(
//             create: (_) => FirestoreService().streamReport(),
//             initialData: Report(),
//             ),
//           );
//         }

//         // Otherwise, show something whilst waiting for initialization to complete
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//   }
// }