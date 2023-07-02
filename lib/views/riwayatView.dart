import 'package:flutter/material.dart';
import '../data/dataRiwayat.dart';
import '../models/models.dart';

class RiwayatView extends StatefulWidget {
  const RiwayatView({super.key});

  @override
  State<RiwayatView> createState() => _RiwayatViewState();
}

class _RiwayatViewState extends State<RiwayatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat"),
        centerTitle: true,
        backgroundColor: Color(0xffff3bd77d),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Divider(
            height: 50,
            thickness: 2,
            indent: 20,
            endIndent: 20,
            color: Color(0xffff3bd77d),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "Riwayat Transaksi Sampah",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: ListView.builder(
              itemCount: dataTransaksi.length,
              itemBuilder: (context, index) {
                riwayatTransaksi riwayat = dataTransaksi[index];
                return Card(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: SizedBox(
                    height: 80,
                    child: ListTile(
                      title: Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                          "${riwayat.nama}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        "${riwayat.berat} Kg",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      trailing: Column(
                        children: [
                          Text(
                            "${riwayat.tanggal}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "+ Rp${riwayat.harga}",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
