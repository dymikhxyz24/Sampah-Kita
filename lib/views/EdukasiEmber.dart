import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EdukasiEmber extends StatefulWidget {
  const EdukasiEmber({super.key});

  @override
  State<EdukasiEmber> createState() => _EdukasiEmberState();
}

class _EdukasiEmberState extends State<EdukasiEmber> {
  final videoUrl = "https://www.youtube.com/watch?v=CI-69iV1mE4";

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
                  'Ember',
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
                  "Dampak dari sampah ember plastik warna adalah pencemaran lingkungan dan kesehatan manusia. Jika tidak dikelola dengan baik, sampah ember plastik ini dapat mencemari tanah, sungai, dan laut.",
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
                  "Untuk mengatasi dampak dari sampah ember plastik warna, cara penanganannya dapat dilakukan dengan cara mendaur ulang atau mengolahnya menjadi barang yang berguna. Selain itu, bisa juga dilakukan dengan cara memisahkan sampah plastik dari jenis lainnya dan membuangnya pada tempat sampah yang sesuai.",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ));
  }
}
