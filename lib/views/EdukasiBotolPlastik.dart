import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EdukasiBotolPlastik extends StatefulWidget {
  const EdukasiBotolPlastik({super.key});

  @override
  State<EdukasiBotolPlastik> createState() => _EdukasiBotolPlastikState();
}

class _EdukasiBotolPlastikState extends State<EdukasiBotolPlastik> {
  final videoUrl = "https://www.youtube.com/watch?v=_15imRbOCW0";

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
                  'Botol Plastik',
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
                  "dari sampah botol plastik sangat merugikan lingkungan. Botol plastik yang terbuang sembarangan dapat menyebabkan kerusakan lingkungan seperti pencemaran tanah, air, dan udara. Botol plastik juga memakan waktu yang lama untuk terurai, sehingga menyebabkan penumpukan sampah di lingkungan",
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
                  "Untuk mengurangi dampak negatif dari sampah botol plastik, ada beberapa cara penanganan yang dapat dilakukan, antara lain: Daur ulang: Botol plastik dapat didaur ulang menjadi produk baru seperti karpet, kantong belanja, dan produk lainnya. Pengurangan penggunaan: Dengan mengurangi penggunaan botol plastik, dapat mengurangi jumlah sampah botol plastik yang dihasilkan.",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ));
  }
}
