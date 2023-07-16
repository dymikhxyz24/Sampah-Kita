import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../providers/providers.dart';
import '../views/jadwalBerlanggananView.dart';
import 'package:provider/provider.dart';

class Berlangganan extends StatefulWidget {
  const Berlangganan({super.key});

  @override
  State<Berlangganan> createState() => _BerlanggananState();
}

class _BerlanggananState extends State<Berlangganan> {
  List<String> lokasiPengambilan = [
    "TPA Terjun (Camping Ground TPA Terjun, Paya Pasir, Kec. Medan Marelan, Kota Medan, Sumatera) 3,7 Km",
    "Bank Sampah Arafah (Jl. Bilal Ujung No.288B, Pulo Brayan Darat I, Kec. Medan Tim., Kota Medan, Sumatera Utara 20237) 12 Km",
    "BANK SAMPAH ANYELIR (Gg. Panjang No.9, Tegal Sari Mandala III, Kec. Medan Denai, Kota Medan, Sumatera Utara 20226) 2,3 Km",
    "Bank Sampah Induk New Normal (Ring Road, Jl. Setia Budi Gg. Mekar Mulyo No.24, Tj. Sari, Kec. Medan Selayang, Kota Medan, Sumatera Utara 20132) 4,2 Km",
    "Bank Sampah Harapan Maju (Jl. Bunga Turi 5 Lk.Iii Kel.Sidomulyo, Guntingan, Kec. Medan Tuntungan, Kota Medan, Sumatera Utara 20137) 5,1 Km",
  ];

  List<String> jadwalPenjemputan = [
    "7 hari / 1 kali",
    "7 hari / 2 kali",
  ];

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<DataBerlanggananProv>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Berlangganan"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Color(0xffff3bd77d),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Berlangganan",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            SizedBox(height: 10),
            Text("Lokasi TPA"),
            SizedBox(height: 5),
            DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSelectedItems: true,
              ),
              items: lokasiPengambilan,
              onChanged: (val) {
                // prov.lokasiTPA = val;
                prov.updateData(lokasiTPA: val);
              },
              selectedItem: lokasiPengambilan[0],
            ),
            SizedBox(height: 20),
            Text("Jadwal Penjemputan"),
            SizedBox(height: 5),
            DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSelectedItems: true,
              ),
              items: jadwalPenjemputan,
              onChanged: (val) {
                // prov.jadwalPenjemputan = val;
                prov.updateData(jadwalPenjemputan: val);
                if (jadwalPenjemputan.indexOf(val!) == 0) {
                  // prov.langkah = 7;
                  prov.updateData(langkah: 7);
                } else if (jadwalPenjemputan.indexOf(val) == 1) {
                  // prov.langkah = 4;
                  prov.updateData(langkah: 4);
                } else {
                  // prov.langkah = 7;
                  prov.updateData(langkah: 7);
                }
                // print(jadwalPenjemputan.indexOf(val!));
              },
              selectedItem: jadwalPenjemputan[0],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Batal"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      minimumSize: Size(120, 40),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return JadwalBerlangganan();
                      }));
                    },
                    child: Text("Verifikasi"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      minimumSize: Size(120, 40),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
