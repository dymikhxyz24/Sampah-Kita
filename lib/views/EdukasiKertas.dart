import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EdukasiKertas extends StatefulWidget {
  const EdukasiKertas({super.key});

  @override
  State<EdukasiKertas> createState() => _EdukasiKertasState();
}

class _EdukasiKertasState extends State<EdukasiKertas> {
  final videoUrl = "https://www.youtube.com/watch?v=JDnWkiXGbcI";

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
                  'Kertas',
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
                  "Dampak dari sampah kertas yang tidak dikelola dengan baik adalah meningkatnya volume sampah di tempat pembuangan akhir (TPA), pemanasan global, dan pengurangan sumber daya alam.",
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
                  "Cara penanganan sampah kertas adalah dengan mendaur ulangnya. Sampah kertas yang masih dapat digunakan kembali dapat disumbangkan ke pihak-pihak yang membutuhkan atau dijual kembali ke pengumpul sampah kertas.",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ));
  }
}
