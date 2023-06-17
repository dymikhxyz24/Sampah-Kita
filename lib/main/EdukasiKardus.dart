import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class EdukasiKardus extends StatefulWidget {
  const EdukasiKardus({Key? key});

  @override
  State<EdukasiKardus> createState() => _EdukasiKardusState();
}

class _EdukasiKardusState extends State<EdukasiKardus> {
  late VideoPlayerController _videoController;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/SampahKardus.mp4')
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
            'Sampah Kardus',
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
            'Dampak dari sampah kardus yang tidak dikelola dengan baik adalah dapat menyebabkan pencemaran lingkungan karena tidak dapat terurai secara alami, serta menimbulkan masalah kesehatan akibat penumpukan sampah tersebut.',
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
            'Untuk mengatasi masalah sampah kardus, salah satu cara penanganannya adalah dengan mendaur ulang atau mengolah kembali kardus bekas menjadi bahan yang dapat digunakan kembali. Selain itu, kardus bekas juga dapat dijual ke pedagang pengumpul sampah untuk dijual kembali ke industri yang memerlukan bahan tersebut.',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
