// import 'package:flutter/material.dart';

// class UserImage extends StatefulWidget {
//   final Function(String imageUrl) onFileChaned;
//   UserImage({
//     required this.onFileChaned,
//   });

//   @override
//   State<UserImage> createState() => _UserImageState();
// }

// class _UserImageState extends State<UserImage> {
//   String? imageUrl;
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       if(imageUrl == null)
//         Icon(Icons.image, size:60,color:Colors.green),
//         if(imageUrl != null)
//         InkWell(
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//           onTap:() => _selectPhoto(),
//           child: AppRoundImage.url(
//             imageUrl,
//             widget :88,
//             hight :88,

//           ),
//         )


      
//     ],);
//   }
// }
