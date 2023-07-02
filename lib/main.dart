import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts/main/DaftarHargaFP.dart';
import 'package:uts/main/info.dart';
import 'package:uts/main/login.dart';
import 'package:uts/main/pesan.dart';
import 'package:uts/main/pesanPage.dart';
import 'package:uts/main/profile.dart';
import 'package:uts/main/register.dart';
import 'package:uts/main/provider.dart';
import 'package:uts/main/splash.dart';
import 'package:uts/main/notifikasi.dart';
import 'package:uts/models/models.dart';
import 'package:uts/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:uts/views/GantiPassword.dart';
import 'package:uts/views/KebijakanPrivasi.dart';
import './providers/providers.dart';
import './views/profil.dart';
import './views/SubFiturProfil.dart';
import './views/jadwalBerlanggananView.dart';
import './views/berlanggananView.dart';
import './views/langgananView.dart';
import './views/mapsPengelolaanViews.dart';
import './views/pengelolaanView.dart';
import './views/pengisianDataDiri2View.dart';
import './views/pengisianDataDiriView.dart';
import './views/riwayatView.dart';
import './views/verifikasiLanggananView.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider(create: (context) => PengelolaanProv()),
        ChangeNotifierProvider(create: (context) => DataDiriProv()),
        ChangeNotifierProvider(create: (context) => DataBerlanggananProv()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: VerifikasiLangganan()),
    );
  }
}
