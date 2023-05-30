import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts/main/login.dart';
import 'package:uts/main/register.dart';
import 'package:uts/main/provider.dart';
import 'package:uts/main/splash.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => MyProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Splash(),
    );
  }
}
