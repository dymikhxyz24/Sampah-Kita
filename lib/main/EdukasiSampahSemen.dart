// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class EdukasiSampahSemenPage extends StatefulWidget {
//   @override
//   _EdukasiSampahSemenPageState createState() => _EdukasiSampahSemenPageState();
// }

// class _EdukasiSampahSemenPageState extends State<EdukasiSampahSemenPage> {
//   late VideoPlayerController _videoController;
//   bool _isVideoPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     _videoController = VideoPlayerController.asset('assets/SampahSemen.mp4')
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
//               ? AspectRatio(
//                   aspectRatio: _videoController.value.aspectRatio,
//                   child: Stack(
//                     children: [
//                       VideoPlayer(_videoController),
//                       Align(
//                         alignment: Alignment.center,
//                         child: IconButton(
//                           icon: Icon(
//                             _isVideoPlaying ? Icons.pause : Icons.play_arrow,
//                             color: Colors.white,
//                             size: 50,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               if (_isVideoPlaying) {
//                                 _videoController.pause();
//                               } else {
//                                 _videoController.play();
//                               }
//                               _isVideoPlaying = !_isVideoPlaying;
//                             });
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               : Container(),
//           ),
//           SizedBox(height: 16.0),
//           Text(
//             'Sampah Semen',
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
//             'Dampak dari sampah semen dapat berdampak buruk bagi kesehatan manusia dan lingkungan sekitarnya. Dalam jangka waktu yang lama, sampah semen dapat mencemari tanah dan menghambat pertumbuhan tanaman, serta dapat mencemari air tanah yang akan mempengaruhi kesehatan manusia jika diminum.',
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
//             'Beberapa metode pengolahan sampah semen yang umum dilakukan antara lain penghancuran atau penggilingan, penggunaan kembali sebagai agregat kasar dalam campuran beton, atau digunakan sebagai bahan bangunan alternatif seperti paving blok dan genteng beton.',
//             style: TextStyle(fontSize: 16.0),
//           ),
//         ],
//       ),
//     );
//   }
// }
