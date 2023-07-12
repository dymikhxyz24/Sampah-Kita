import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../providers/providers.dart';
import '../views/verifikasiLanggananView.dart';
import 'package:provider/provider.dart';

class PengisianDataDiriSecond extends StatefulWidget {
  const PengisianDataDiriSecond({super.key});

  @override
  State<PengisianDataDiriSecond> createState() =>
      _PengisianDataDiriSecondState();
}

class _PengisianDataDiriSecondState extends State<PengisianDataDiriSecond> {
  String? imageFile;
  String? provinsi;
  String? kota;
  String? kecamatan;
  String? kelurahan;
  String? alamat;
  String? kodePos;

  void openFiles() async {
    FilePickerResult? resulFile =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (resulFile != null) {
      PlatformFile file = resulFile.files.first;
      setState(() {
        imageFile = file.name.toString();
      });
    }
  }

  List<String> provinsiList = ["Sumatera Utara"];
  List<String> kotaList = ["Medan"];
  List<String> kecamatanList = [
    "Medan Johor",
    "Medan Maimun",
    "Medan Marelan",
    "Medan Sunggal"
  ];
  List<String> kelurahanList = ["Pangkalan Mansyur", "Titi Kuning", "Sukamaju"];

  @override
  Widget build(BuildContext context) {
    var prov1 = Provider.of<RegisterData>(context);
    final prov = Provider.of<DataDiriProv>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Diri"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Color(0xffff3bd77d),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Foto KTP",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              SizedBox(height: 10),
              Text("Unggah Foto KTP"),
              Container(
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
                        child: Text(
                          "Upload File",
                          style: TextStyle(color: Colors.black),
                        )),
                    Expanded(
                        child: Text(
                      imageFile ?? "unggah foto anda",
                      style: TextStyle(),
                      textAlign: TextAlign.center,
                    ))
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Alamat Tempat Tinggal",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              SizedBox(height: 10),
              Text("Provinsi"),
              DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                ),
                items: provinsiList,
                onChanged: (val) {
                  setState(() {
                    provinsi = val;
                  });
                },
                selectedItem: provinsiList[0],
              ),
              SizedBox(height: 20),
              Text("Kabupaten / Kota"),
              DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                ),
                items: kotaList,
                onChanged: (val) {
                  setState(() {
                    kota = val;
                  });
                },
                selectedItem: kotaList[0],
              ),
              SizedBox(height: 20),
              Text("Kecamatan"),
              DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                ),
                items: kecamatanList,
                onChanged: (val) {
                  setState(() {
                    kecamatan = val;
                  });
                },
                selectedItem: kecamatanList[0],
              ),
              SizedBox(height: 20),
              Text("Kelurahan"),
              DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                ),
                items: kelurahanList,
                onChanged: (val) {
                  setState(() {
                    kelurahan = val;
                  });
                },
                selectedItem: kelurahanList[0],
              ),
              SizedBox(height: 20),
              Text("Alamat"),
              SingleChildScrollView(
                child: TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  onChanged: (val) {
                    setState(() {
                      alamat = val;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              Text("Kode Pos"),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                onChanged: (val) {
                  setState(() {
                    kodePos = val;
                  });
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
                      child: Text("Kembali"),
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
                        if (imageFile != null &&
                            kota != null &&
                            kecamatan != null &&
                            kelurahan != null &&
                            alamat != null &&
                            kodePos != null) {
                          prov.updateData(
                              fotoKTP: imageFile!.trim(),
                              kota: kota!.trim(),
                              kecamatan: kecamatan!.trim(),
                              kelurahan: kelurahan!.trim(),
                              alamat: alamat!.trim(),
                              kodePos: kodePos!.trim());
                          prov1.updateUserData2(kota!.trim());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => VerifikasiLangganan()));
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
      ),
    );
  }
}
