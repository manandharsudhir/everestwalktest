// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../services/image_picker_service.dart';

// class ImageFilePickerUtils {
//   /// open bottom sheet with image picker options
//   /// camera, file and galery are availabe for this
//   static Future<dynamic> openImageSheet(BuildContext context) {
//     return showModalBottomSheet(
//       isScrollControlled: true,
//       isDismissible: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
//       ),
//       backgroundColor: Colors.white,
//       builder: (BuildContext context) {
//         return Consumer(
//           builder: (_, WidgetRef ref, __) {
//             final imageProvider = ref.watch(imageserviceProvider);
//             return Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   ListTile(
//                     onTap: () {
//                       imageProvider.getImage(1);
//                       Navigator.pop(context);
//                     },
//                     leading: const Icon(
//                       Icons.camera,
//                       size: 30,
//                     ),
//                     title: const Text('Camera'),
//                   ),
//                   ListTile(
//                     onTap: () {
//                       imageProvider.getImage(0);
//                       Navigator.pop(context);
//                     },
//                     leading: const Icon(
//                       Icons.photo_camera_back_rounded,
//                       size: 30,
//                     ),
//                     title: const Text('Gallery'),
//                   ),
//                   ListTile(
//                     onTap: () {
//                       imageProvider.getImage(2);
//                       Navigator.pop(context);
//                     },
//                     leading: const Icon(
//                       Icons.file_copy_sharp,
//                       size: 30,
//                     ),
//                     title: const Text('file'),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//       context: context,
//     );
//   }
// }
