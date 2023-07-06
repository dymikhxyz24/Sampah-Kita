import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EdukasiKardus extends StatefulWidget {
  const EdukasiKardus({super.key});

  @override
  State<EdukasiKardus> createState() => _EdukasiKardusState();
}

class _EdukasiKardusState extends State<EdukasiKardus> {
  final videoUrl = "https://www.youtube.com/watch?v=lng70rxNRe8";

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
                  'Kardus',
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
                  "Dampak dari sampah kardus yang tidak dikelola dengan baik adalah dapat menyebabkan pencemaran lingkungan karena tidak dapat terurai secara alami, serta menimbulkan masalah kesehatan akibat penumpukan sampah tersebut.",
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
                  "Untuk mengatasi masalah sampah kardus, salah satu cara penanganannya adalah dengan mendaur ulang atau mengolah kembali kardus bekas menjadi bahan yang dapat digunakan kembali. Selain itu, kardus bekas juga dapat dijual ke pedagang pengumpul sampah untuk dijual kembali ke industri yang memerlukan bahan tersebut.",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ));
  }
}
