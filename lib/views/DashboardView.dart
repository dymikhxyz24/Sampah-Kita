import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts/providers/providers.dart';
import 'package:uts/views/DaftarHargaFP.dart';
import 'package:uts/views/EdukasiBesi.dart';
import 'package:uts/views/cardHello.dart';
import 'package:uts/views/MyList.dart';
import 'package:uts/views/SubFiturProfil.dart';
import 'package:uts/views/berlanggananView.dart';
import 'package:uts/views/langgananView.dart';
import 'package:uts/views/pengelolaanView.dart';
import 'package:uts/views/profil.dart';
import 'package:uts/views/riwayatView.dart';
import 'package:uts/views/cardThanks.dart';

import 'package:uts/views/cardTruck.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<DataDiriProv>(context);
    var prov1 = Provider.of<RegisterData>(context);
    var prov2 = Provider.of<PengelolaanProv>(context);
    bool _showFirstCard = true;
    bool _showSecondCard = false;

    void _onFirstCardClosed() {
      setState(() {
        _showFirstCard = false;
        _showSecondCard = true;
      });
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 190,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(55),
                    bottomRight: Radius.circular(55))),
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Image(
                      image: NetworkImage(
                          "https://cdn.discordapp.com/attachments/942624379735511100/1122850687991169104/man.png",
                          scale: 2)),
                  Text(
                    prov1.userLogin['Nama'],
                    // prov1.userLogin['Nama'],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Text(
                  "Layanan",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 10,
                        shadowColor: Colors.black,
                        color: Colors.greenAccent[100],
                        child: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EdukasiList())),
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Image.network(
                                    "https://cdn.discordapp.com/attachments/972198684550897696/1113823102523146380/ecology-book.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Column(children: [
                                Text(
                                  "Edukasi",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ])
                            ]),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                          shadowColor: Colors.black,
                          color: Colors.greenAccent[100],
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PengelolaanView())),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Image.network(
                                      "https://cdn.discordapp.com/attachments/972198684550897696/1113826709830123542/waste.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Column(children: [
                                  Text(
                                    "Pengelolaan",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ])
                              ]),
                            ),
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                          shadowColor: Colors.black,
                          color: Colors.greenAccent[100],
                          child: InkWell(
                            onTap: () {
                              if (prov.namaLengkap == "") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LangganganView()));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Berlangganan()));
                              }
                            },
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Image.network(
                                      "https://cdn.discordapp.com/attachments/972198684550897696/1113826744479256656/market.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Column(children: [
                                  Text(
                                    "Berlangganan",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ])
                              ]),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                          shadowColor: Colors.black,
                          color: Colors.greenAccent[100],
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DaftarHargaFP())),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Image.network(
                                      "https://cdn.discordapp.com/attachments/972198684550897696/1113826756063932496/sales.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Column(children: [
                                  Text(
                                    "Daftar Harga",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ])
                              ]),
                            ),
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                          shadowColor: Colors.black,
                          color: Colors.greenAccent[100],
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RiwayatView())),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Image.network(
                                      "https://cdn.discordapp.com/attachments/972198684550897696/1113826770131624027/time.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Column(children: [
                                  Text(
                                    "Riwayat",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ])
                              ]),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                          shadowColor: Colors.black,
                          color: Colors.greenAccent[100],
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubProfil())),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Image.network(
                                      "https://cdn.discordapp.com/attachments/972198684550897696/1113826804944347178/resume.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Column(children: [
                                  Text(
                                    "Profil",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ])
                              ]),
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: prov2.tanggalPengambilan == ''
                ? hello()
                : prov2.tanggalPengambilan == "DONE"
                    ? thanks()
                    : prov2.tanggalPengambilan != ''
                        ? onTheWay()
                        : null,
          )
        ],
      ),
    );
  }
}
