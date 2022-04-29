// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class MediaPicker extends StatefulWidget {
//   const MediaPicker({Key? key}) : super(key: key);

//   @override
//   State<MediaPicker> createState() => _MediaPickerState();
// }

// class _MediaPickerState extends State<MediaPicker> {
//   List<XFile>? _imageFileList;

//   set _imageFile(XFile? value) {
//     _imageFileList = value == null ? null : <XFile>[value];
//   }

//   dynamic _pickImageError;
//   bool isVideo = false;
//   String? _retrieveDataError;

//   final ImagePicker _picker = ImagePicker();
//   final TextEditingController maxWidthController = TextEditingController();
//   final TextEditingController maxHeightController = TextEditingController();
//   final TextEditingController qualityController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }

//   Future<void> _onImageButtonPressed(ImageSource source,
//       {BuildContext? context, bool isMultiImage = false}) async {
//     if (isMultiImage) {
//       await _displayPickImageDialog(context!,
//           (double? maxWidth, double? maxHeight, int? quality) async {
//         try {
//           final List<XFile>? pickedFileList = await _picker.pickMultiImage(
//             maxWidth: maxWidth,
//             maxHeight: maxHeight,
//             imageQuality: quality,
//           );
//           setState(() {
//             _imageFileList = pickedFileList;
//           });
//         } catch (e) {
//           setState(() {
//             _pickImageError = e;
//           });
//         }
//       });
//     } else {
//       await _displayPickImageDialog(context!,
//           (double? maxWidth, double? maxHeight, int? quality) async {
//         try {
//           final XFile? pickedFile = await _picker.pickImage(
//             source: source,
//             maxWidth: maxWidth,
//             maxHeight: maxHeight,
//             imageQuality: quality,
//           );
//           setState(() {
//             _imageFile = pickedFile;
//           });
//         } catch (e) {
//           setState(() {
//             _pickImageError = e;
//           });
//         }
//       });
//     }
//   }

//   Future<void> _displayPickImageDialog(
//       BuildContext context, OnPickImageCallback onPick) async {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Add optional parameters'),
//             content: Column(
//               children: <Widget>[
//                 TextField(
//                   controller: maxWidthController,
//                   keyboardType:
//                       const TextInputType.numberWithOptions(decimal: true),
//                   decoration: const InputDecoration(
//                       hintText: 'Enter maxWidth if desired'),
//                 ),
//                 TextField(
//                   controller: maxHeightController,
//                   keyboardType:
//                       const TextInputType.numberWithOptions(decimal: true),
//                   decoration: const InputDecoration(
//                       hintText: 'Enter maxHeight if desired'),
//                 ),
//                 TextField(
//                   controller: qualityController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                       hintText: 'Enter quality if desired'),
//                 ),
//               ],
//             ),
//             actions: <Widget>[
//               TextButton(
//                 child: const Text('CANCEL'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               TextButton(
//                   child: const Text('PICK'),
//                   onPressed: () {
//                     final double? width = maxWidthController.text.isNotEmpty
//                         ? double.parse(maxWidthController.text)
//                         : null;
//                     final double? height = maxHeightController.text.isNotEmpty
//                         ? double.parse(maxHeightController.text)
//                         : null;
//                     final int? quality = qualityController.text.isNotEmpty
//                         ? int.parse(qualityController.text)
//                         : null;
//                     onPick(width, height, quality);
//                     Navigator.of(context).pop();
//                   }),
//             ],
//           );
//         });
//   }
//   typedef OnPickImageCallback = void Function(
//     double? maxWidth, double? maxHeight, int? quality);
// }

// pickImage() async {
//   final getImage = await ImagePicker().getImage(source: ImageSource.gallery);
// }
