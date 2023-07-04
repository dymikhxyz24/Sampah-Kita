import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts/providers/providers.dart';
import 'package:uts/views/DaftarHargaFP.dart';
import 'package:uts/views/EdukasiBesi.dart';
import 'package:uts/views/berlanggananView.dart';
import 'package:uts/views/langgananView.dart';
import 'package:uts/views/pengelolaanView.dart';
import 'package:uts/views/profil.dart';
import 'package:uts/views/riwayatView.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<DataDiriProv>(context);
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Image(
                            image: NetworkImage(
                                "https://cdn.discordapp.com/attachments/972198684550897696/1113113994664878101/Group_17.png",
                                scale: 1.5)),
                        Text(
                          "M Shahwal Ramadhan Boger",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                              color: Colors.white),
                        )
                      ],
                    ))
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Pilih Layanan",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Card Button Pilih Layanan
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  color: Colors.greenAccent[100],
                  child: InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EdukasiBesi())),
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
                    elevation: 50,
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
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent[100],
                    child: InkWell(
                      onTap: () {
                        if (prov.namaLengkap == "") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LangganganView()));
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ])
                        ]),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                    elevation: 50,
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
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                    elevation: 50,
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ])
                        ]),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent[100],
                    child: InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profil())),
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
                              style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}
