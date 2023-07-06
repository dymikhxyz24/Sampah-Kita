import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EdukasiLogam extends StatefulWidget {
  const EdukasiLogam({super.key});

  @override
  State<EdukasiLogam> createState() => _EdukasiLogamState();
}

class _EdukasiLogamState extends State<EdukasiLogam> {
  final videoUrl = "https://www.youtube.com/watch?v=WQr4fVcS-Pg";

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
                  'Logam',
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
                  "Dampak dari sampah logam pada lingkungan dapat sangat berbahaya, terutama jika tidak dikelola dengan baik. Salah satu dampaknya adalah pencemaran tanah dan air karena zat-zat berbahaya dalam sampah logam seperti timbal dan merkuri yang dapat merusak ekosistem. ",
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
                  "Cara penanganan sampah logam meliputi pengumpulan, pemisahan, dan pengolahan. Pengumpulan dilakukan dengan cara memisahkan sampah logam dari sampah rumah tangga lainnya dan mengumpulkannya secara terpisah. Selanjutnya, sampah logam dapat diolah kembali melalui proses daur ulang untuk mengurangi dampak lingkungan.",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ));
  }
}
