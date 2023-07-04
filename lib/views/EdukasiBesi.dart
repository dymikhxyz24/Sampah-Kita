import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class EdukasiBesi extends StatefulWidget {
  const EdukasiBesi({Key? key});

  @override
  _EdukasiBesiState createState() => _EdukasiBesiState();
}

class _EdukasiBesiState extends State<EdukasiBesi> {
  late VideoPlayerController _videoController;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/SampahBesi.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Edukasi'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Container(
            // Video widget here
            width: double.infinity,
            height: 200,
            child: _videoController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _videoController.value.aspectRatio,
                    child: Stack(
                      children: [
                        VideoPlayer(_videoController),
                        Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: Icon(
                              _isVideoPlaying ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                              size: 50,
                            ),
                            onPressed: () {
                              setState(() {
                                if (_isVideoPlaying) {
                                  _videoController.pause();
                                } else {
                                  _videoController.play();
                                }
                                _isVideoPlaying = !_isVideoPlaying;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
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
    );
  }
}
