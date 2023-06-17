import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class EdukasiLogam extends StatefulWidget {
  @override
  _EdukasiLogamState createState() => _EdukasiLogamState();
}

class _EdukasiLogamState extends State<EdukasiLogam> {
  late VideoPlayerController _videoController;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/SampahLogam.mp4')
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
            'Sampah Kertas',
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
            'Dampak dari sampah kertas yang tidak dikelola dengan baik adalah meningkatnya volume sampah di tempat pembuangan akhir (TPA), pemanasan global, dan pengurangan sumber daya alam.',
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
            'Cara penanganan sampah kertas adalah dengan mendaur ulangnya. Sampah kertas yang masih dapat digunakan kembali dapat disumbangkan ke pihak-pihak yang membutuhkan atau dijual kembali ke pengumpul sampah kertas.',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
