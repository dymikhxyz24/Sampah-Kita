import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class EdukasiBotolBeling extends StatefulWidget {
  const EdukasiBotolBeling({Key? key});

  @override
  _EdukasiBotolBelingState createState() => _EdukasiBotolBelingState();
}

class _EdukasiBotolBelingState extends State<EdukasiBotolBeling> {
  late VideoPlayerController _videoController;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/SampahBotolBeling.mp4')
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
            'Dampak dari sampah botol beling yang tidak terkelola dengan baik adalah terjadinya pencemaran lingkungan. Kaca yang dibuang sembarangan dapat menimbulkan bahaya fisik bagi manusia dan hewan, seperti terinjak dan mengakibatkan luka.',
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
            'Cara penanganan sampah botol beling yang baik adalah dengan cara mendaur ulang atau recycling. Kaca yang sudah tidak terpakai dapat didaur ulang menjadi bahan yang dapat digunakan kembali seperti botol kaca baru atau bahan kerajinan. Selain itu, cara penanganan yang baik adalah dengan memisahkan kaca dari sampah organik dan anorganik lainnya.',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
