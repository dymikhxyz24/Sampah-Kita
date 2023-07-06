import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EdukasiSampahSemen extends StatefulWidget {
  const EdukasiSampahSemen({super.key});

  @override
  State<EdukasiSampahSemen> createState() => _EdukasiSampahSemenState();
}

class _EdukasiSampahSemenState extends State<EdukasiSampahSemen> {
  final videoUrl = "https://www.youtube.com/watch?v=iR5EeXbZP90";

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags:
            YoutubePlayerFlags(autoPlay: false, controlsVisibleAtStart: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffff3bd77d),
          title: Text('Edukasi'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Sampah Semen',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Dampak:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Dampak dari sampah semen dapat berdampak buruk bagi kesehatan manusia dan lingkungan sekitarnya. Dalam jangka waktu yang lama, sampah semen dapat mencemari tanah dan menghambat pertumbuhan tanaman, serta dapat mencemari air tanah yang akan mempengaruhi kesehatan manusia jika diminum.",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Cara Penanganan:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Beberapa metode pengolahan sampah semen yang umum dilakukan antara lain penghancuran atau penggilingan, penggunaan kembali sebagai agregat kasar dalam campuran beton, atau digunakan sebagai bahan bangunan alternatif seperti paving blok dan genteng beton.",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ));
  }
}
