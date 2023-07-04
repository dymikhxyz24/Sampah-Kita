// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class EdukasiEmber extends StatefulWidget {
//   const EdukasiEmber({Key? key}) : super(key: key);

//   @override
//   State<EdukasiEmber> createState() => _EdukasiEmberState();
// }

// class _EdukasiEmberState extends State<EdukasiEmber> {
//   late VideoPlayerController _videoController;
//   bool _isVideoPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     _videoController = VideoPlayerController.asset('assets/SampahEmber.mp4')
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _videoController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text('Edukasi'),
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(16.0),
//         children: [
//           Container(
//             // Video widget here
//             width: double.infinity,
//             height: 200,
//             child: _videoController.value.isInitialized
//                 ? AspectRatio(
//                     aspectRatio: _videoController.value.aspectRatio,
//                     child: Stack(
//                       children: [
//                         VideoPlayer(_videoController),
//                         Align(
//                           alignment: Alignment.center,
//                           child: IconButton(
//                             icon: Icon(
//                               _isVideoPlaying ? Icons.pause : Icons.play_arrow,
//                               color: Colors.white,
//                               size: 50,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 if (_isVideoPlaying) {
//                                   _videoController.pause();
//                                 } else {
//                                   _videoController.play();
//                                 }
//                                 _isVideoPlaying = !_isVideoPlaying;
//                               });
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 : Container(),
//           ),
//           SizedBox(height: 16.0),
//           Text(
//             'Ember Plastik Warna',
//             style: TextStyle(
//               fontSize: 24.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 8.0),
//           Text(
//             'Dampak:',
//             style: TextStyle(
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 8.0),
//           Text(
//             'Dampak dari sampah ember plastik warna adalah pencemaran lingkungan dan kesehatan manusia. Jika tidak dikelola dengan baik, sampah ember plastik ini dapat mencemari tanah, sungai, dan laut.',
//             style: TextStyle(fontSize: 16.0),
//           ),
//           SizedBox(height: 16.0),
//           Text(
//             'Cara Penanganan:',
//             style: TextStyle(
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 8.0),
//           Text(
//             'Untuk mengatasi dampak dari sampah ember plastik warna, cara penanganannya dapat dilakukan dengan cara mendaur ulang atau mengolahnya menjadi barang yang berguna. Selain itu, bisa juga dilakukan dengan cara memisahkan sampah plastik dari jenis lainnya dan membuangnya pada tempat sampah yang sesuai.',
//             style: TextStyle(fontSize: 16.0),
//           ),
//         ],
//       ),
//     );
//   }
// }
