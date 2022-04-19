
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';


// class AppRoundImage
//  extends StatelessWidget {
   
//   final ImageProvider provider;
//   final double height;
//   final double width;

//   AppRoundImage(this.provider,{
//     required this.height,
//     required this.width,
//   });

 
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(height /2),
//       child: Image(image: provider,
//       height: height,
//       width: width ,),
      
//     );
//   }
// }
// Factory AppRoundImage.url(String url, {required double height, required double width}){
//   return AppRoundImage(
//     NetworkImage(url),
//     height: height,
//     width:width,
//   );
// }