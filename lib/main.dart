//import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../providers/providers.dart';
import '../views/login.dart';

void main() {
  initializeDateFormatting("id_ID");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterData()),
        ChangeNotifierProvider(create: (context) => PengelolaanProv()),
        ChangeNotifierProvider(create: (context) => DataDiriProv()),
        ChangeNotifierProvider(create: (context) => DataBerlanggananProv()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.green),
          home: Login()),
    );
  }
}
