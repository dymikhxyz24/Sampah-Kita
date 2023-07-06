import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EdukasiBesi extends StatefulWidget {
  const EdukasiBesi({super.key});

  @override
  State<EdukasiBesi> createState() => _EdukasiBesiState();
}

class _EdukasiBesiState extends State<EdukasiBesi> {
  final videoUrl = "https://www.youtube.com/watch?v=qqPRduwuUzs";

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
                  'Besi',
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
                  'Dampak dari sampah besi dapat mencemari lingkungan dan menyebabkan kerusakan ekosistem. Limbah besi yang tidak dikelola dengan baik dapat menyebabkan polusi air dan tanah serta mengganggu kehidupan organisme di sekitarnya.',
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
                  'Pengolahan sampah besi umumnya melibatkan proses daur ulang. Sampah besi dapat diproses menjadi baja baru melalui peleburan dan pengecoran ulang. Selain itu, penggunaan kembali dan daur ulang juga dapat mengurangi dampak lingkungan dari sampah besi.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ));
  }
}
