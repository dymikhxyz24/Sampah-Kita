import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/providers.dart';
import '../views/mapsPengelolaanViews.dart';
import 'package:provider/provider.dart';

class PengelolaanView extends StatefulWidget {
  const PengelolaanView({super.key});

  @override
  State<PengelolaanView> createState() => _PengelolaanViewState();
}

class _PengelolaanViewState extends State<PengelolaanView> {
  List<String> tanggalPengambilan = generateDate();

  List<String> waktuPengambilan = [
    "Pagi (09.00 - 12.00)",
    "Siang (14.00 - 16.00)"
  ];
  List<String> lokasiPengambilan = [
    "TPA Terjun (Camping Ground TPA Terjun, Paya Pasir, Kec. Medan Marelan, Kota Medan, Sumatera) 3,7 Km",
    "Bank Sampah Arafah (Jl. Bilal Ujung No.288B, Pulo Brayan Darat I, Kec. Medan Tim., Kota Medan, Sumatera Utara 20237) 12 Km",
    "BANK SAMPAH ANYELIR (Gg. Panjang No.9, Tegal Sari Mandala III, Kec. Medan Denai, Kota Medan, Sumatera Utara 20226) 2,3 Km",
    "Bank Sampah Induk New Normal (Ring Road, Jl. Setia Budi Gg. Mekar Mulyo No.24, Tj. Sari, Kec. Medan Selayang, Kota Medan, Sumatera Utara 20132) 4,2 Km",
    "Bank Sampah Harapan Maju (Jl. Bunga Turi 5 Lk.Iii Kel.Sidomulyo, Guntingan, Kec. Medan Tuntungan, Kota Medan, Sumatera Utara 20137) 5,1 Km",
  ];

  List<List<double>> latlong = [
    [3.7193066711315677, 98.6498790106402],
    [3.6214414611770978, 98.69175981063968],
    [3.577200886805148, 98.71418472598397],
    [3.5608826913865554, 98.62417225296709],
    [3.504423997975308, 98.60846171409467]
  ];

  List<String> jenisSampah = [
    "Besi",
    "Botol Plastik",
    "Botol Beling",
    "Logam",
    "Ember Plastik",
    "Kantong Semen",
    "Kardus",
    "Kertas"
  ];

  int rowSampah = 1;

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<PengelolaanProv>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengelolaan"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Color(0xffff3bd77d),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(15),
              color: Color(0xffffb7fb82),
              elevation: 2,
              child: SizedBox(
                height: 180,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 3),
                      child: ListTile(
                        leading: Image.network(
                          "https://media.discordapp.net/attachments/942624379735511100/1120296291994443866/bell.png",
                          height: 45,
                        ),
                        title: Text(
                          "Pengingat !",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.black,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Text(
                        "Yuk, kita mulai memilah sampah dan menjualnya\nke pengepul, dengan berat minimal 10 kg untuk mendapatkan penghasilan tambahan dan membantu menjaga lingkungan!",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text("Unggah Foto Sampah"),
              subtitle: Container(
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          openFiles();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          minimumSize: MaterialStatePropertyAll(
                            Size(100, 40),
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color: Colors.grey, width: 1),
                            ),
                          ),
                          elevation: MaterialStatePropertyAll(0),
                        ),
                        child: Text("Upload File")),
                    Expanded(
                        child: Text(
                      prov.fotoSampah,
                      style: TextStyle(),
                      textAlign: TextAlign.center,
                    ))
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text("Keterangan"),
              subtitle: Container(
                // height: 200,
                child: SingleChildScrollView(
                  child: TextField(
                    onChanged: (value) {
                      prov.setKeterangan(value);
                    },
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              indent: 18,
              endIndent: 18,
            ),
            ListTile(
              title: Text("Tanggal Pengambilan"),
              subtitle: DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                ),
                items: tanggalPengambilan,
                onChanged: (value) {
                  prov.setTanggalPengambilan(value);
                },
                selectedItem: tanggalPengambilan[0],
              ),
            ),
            ListTile(
              title: Text("Waktu Pengambilan"),
              subtitle: DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                ),
                items: waktuPengambilan,
                onChanged: (value) {
                  prov.setWaktuPengambilan(value);
                },
                selectedItem: waktuPengambilan[0],
              ),
            ),
            ListTile(
              title: Text("Lokasi Pengambilan"),
              subtitle: DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                ),
                items: lokasiPengambilan,
                onChanged: (value) {
                  int idx = lokasiPengambilan.indexOf(value!);
                  prov.setLokasiPengambilan(value);
                  prov.setLatitude(latlong[idx][0]);
                  prov.setLongtitude(latlong[idx][1]);

                  print(prov.lati);
                  print(prov.long);
                },
                selectedItem: "Silahkan pilih lokasi pengambilan sampah",
              ),
            ),
            Divider(
              thickness: 2,
              indent: 18,
              endIndent: 18,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: rowSampah,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 15, top: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jenis Sampah",
                              style: TextStyle(fontSize: 15),
                            ),
                            DropdownSearch<String>(
                              popupProps: PopupProps.menu(
                                showSelectedItems: true,
                              ),
                              items: jenisSampah,
                              onChanged: (value) {
                                prov.tambahJenisBerat(value, "10 kg");
                              },
                              selectedItem: "pilih",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Berat Sampah (Kg)",
                                style: TextStyle(fontSize: 15)),
                            SizedBox(
                              height: 48,
                              child: TextField(
                                onChanged: (value) {
                                  prov.ubahJenisBerat(
                                      index,
                                      prov.jenisBerat[index].jenisSampah,
                                      value);
                                },
                                textAlignVertical: TextAlignVertical.top,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Tambah Lagi",
                              style: TextStyle(fontSize: 15),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  rowSampah++;
                                });
                              },
                              icon: Icon(
                                Icons.add_circle_rounded,
                                color: Colors.blue,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 5)
                    ],
                  ),
                );
              },
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
                      minimumSize: Size(120, 50),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(prov.tanggalPengambilan);
                      print(prov.lokasiPengambilan);
                      if (prov.tanggalPengambilan != "" &&
                          prov.lokasiPengambilan != "") {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return MapsPengelolaanView();
                        }));
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: Text("Terjadi Error"),
                                  content: Text("Silahkan lengkapi data"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, 'OK');
                                        },
                                        child: Text("OK"))
                                  ],
                                ));
                      }
                    },
                    child: Text("Tambah"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      minimumSize: Size(120, 50),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void openFiles() async {
    FilePickerResult? resulFile =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (resulFile != null) {
      PlatformFile file = resulFile.files.first;
      String fileImage = file.name.toString();
      Provider.of<PengelolaanProv>(context, listen: false)
          .setFotoSampah(fileImage);
    }
  }
}

List<String> generateDate() {
  DateTime hariIni = DateTime.now();
  List<String> tanggals = [];

  for (int i = 0; i < 5; i++) {
    String formatDate = DateFormat("EEEE, dd MMMM y", "id_ID").format(hariIni);
    tanggals.add(formatDate);

    hariIni = hariIni.add(Duration(days: 1));
  }

  return tanggals;
}
