import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EdukasiBotolBeling extends StatefulWidget {
  const EdukasiBotolBeling({super.key});

  @override
  State<EdukasiBotolBeling> createState() => _EdukasiBotolBelingState();
}

class _EdukasiBotolBelingState extends State<EdukasiBotolBeling> {
  final videoUrl = "https://www.youtube.com/watch?v=lslvhR_8ZP8";

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
                  'Botol Beling',
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
                  "Dampak dari sampah botol beling yang tidak terkelola dengan baik adalah terjadinya pencemaran lingkungan. Kaca yang dibuang sembarangan dapat menimbulkan bahaya fisik bagi manusia dan hewan, seperti terinjak dan mengakibatkan luka.",
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
                  "Cara penanganan sampah botol beling yang baik adalah dengan cara mendaur ulang atau recycling. Kaca yang sudah tidak terpakai dapat didaur ulang menjadi bahan yang dapat digunakan kembali seperti botol kaca baru atau bahan kerajinan. Selain itu, cara penanganan yang baik adalah dengan memisahkan kaca dari sampah organik dan anorganik lainnya.",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ));
  }
}
