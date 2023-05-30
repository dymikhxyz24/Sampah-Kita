import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:uts/main/register.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Color.fromARGB(255, 183, 251, 131),
      seconds: 3,
      navigateAfterSeconds: new Register(),
      image: new Image.network(
        'https://cdn.discordapp.com/attachments/972198684550897696/1113113994664878101/Group_17.png',
      ),
      loadingText: Text("Loading"),
      photoSize: 200.0,
      loaderColor: Colors.green,
    );
  }
}
