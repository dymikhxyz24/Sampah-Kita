import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class EdukasiBotolPlastik extends StatefulWidget {
  const EdukasiBotolPlastik({Key? key}) : super(key: key);

  @override
  State<EdukasiBotolPlastik> createState() => _EdukasiBotolPlastikState();
}

class _EdukasiBotolPlastikState extends State<EdukasiBotolPlastik> {
  late VideoPlayerController _videoController;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/SampahBotolPlastik.mp4')
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
            'Dampak dari sampah botol plastik sangat merugikan lingkungan. Botol plastik yang terbuang sembarangan dapat menyebabkan kerusakan lingkungan seperti pencemaran tanah, air, dan udara. Botol plastik juga memakan waktu yang lama untuk terurai, sehingga menyebabkan penumpukan sampah di lingkungan.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            'Cara Pengelolaan:',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Untuk mengurangi dampak negatif dari sampah botol plastik, ada beberapa cara penanganan yang dapat dilakukan, antara lain, daur ulang: Botol plastik dapat didaur ulang menjadi produk baru seperti karpet, kantong belanja, dan produk lainnya. Pengurangan penggunaan: Dengan mengurangi penggunaan botol plastik, dapat mengurangi jumlah sampah botol plastik yang dihasilkan.',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
