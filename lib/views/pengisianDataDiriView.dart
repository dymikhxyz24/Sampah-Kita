import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/providers.dart';
import '../views/pengisianDataDiri2View.dart';
import 'package:provider/provider.dart';

class PengisianDataDiri extends StatefulWidget {
  const PengisianDataDiri({super.key});

  @override
  State<PengisianDataDiri> createState() => _PengisianDataDiriState();
}

class _PengisianDataDiriState extends State<PengisianDataDiri> {
  String? namaPanggilan;
  String? namaLengkap;
  String? email;
  String? noHP;
  DateTime? selectedDate;
  String? selectedGender;
  String? pendidikanTerakhir;
  String? pekerjaan;
  String? tanggalLahir;

  List<String> pendidikanTerakhirList = [
    "SD",
    "SMP",
    "SMA",
  ];

  List<String> pekerjaanList = [
    "Wiraswasta/Wirausaha",
    "Pelajar/Mahasiswa",
    "Belum Bekerja",
    "Buruh"
  ];

  final dateFormat = DateFormat('dd MMMM yyyy');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime(2010),
      firstDate: DateTime(1900),
      lastDate: DateTime(2011),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                  primary: Color(0xffff3bd77d),
                  onPrimary: Colors.white,
                  onSurface: Colors.black)),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        // selectedDate = pickedDate;
        tanggalLahir = dateFormat.format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Data Diri",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Nama Panggilan"),
                  filled: true,
                  fillColor: Colors.white,
                ),
                cursorColor: Colors.green,
                onChanged: (val) {
                  setState(() {
                    namaPanggilan = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Nama Lengkap"),
                    filled: true,
                    fillColor: Colors.white),
                onChanged: (val) {
                  setState(() {
                    namaLengkap = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Email"),
                    filled: true,
                    fillColor: Colors.white),
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("No HP"),
                    filled: true,
                    fillColor: Colors.white),
                onChanged: (val) {
                  setState(() {
                    noHP = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tanggal Lahir"),
                        ElevatedButton(
                          onPressed: () {
                            _selectDate(context);
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.black),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                      color: Colors.grey, width: 1.5),
                                ),
                              ),
                              elevation: MaterialStatePropertyAll(0)),
                          child: Text(
                              tanggalLahir != null
                                  ? tanggalLahir!
                                  : 'Pilih tanggal',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Text("Jenis Kelamin"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                            value: "pria",
                            groupValue: selectedGender,
                            onChanged: (val) {
                              setState(() {
                                selectedGender = val;
                              });
                            },
                            activeColor: Colors.green,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                          ),
                          Text("L"),
                          Radio(
                            value: "wanita",
                            groupValue: selectedGender,
                            onChanged: (val) {
                              setState(() {
                                selectedGender = val;
                              });
                            },
                            activeColor: Colors.green,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                          ),
                          Text("P"),
                        ],
                      ),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text("Pendidikan Terakhir"),
              DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                ),
                items: pendidikanTerakhirList,
                onChanged: (val) {
                  setState(() {
                    pendidikanTerakhir = val;
                  });
                },
                selectedItem: pendidikanTerakhirList[0],
              ),
              SizedBox(
                height: 20,
              ),
              Text("Pekerjaan"),
              DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                ),
                items: pekerjaanList,
                onChanged: (val) {
                  setState(() {
                    pekerjaan = val;
                  });
                },
                selectedItem: pekerjaanList[0],
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
                        if (namaPanggilan != null &&
                            namaLengkap != null &&
                            email != null &&
                            noHP != null &&
                            tanggalLahir != null &&
                            selectedGender != null &&
                            pendidikanTerakhir != null &&
                            pekerjaan != null) {
                          prov.updateData(
                              namaPanggilan: namaPanggilan,
                              namaLengkap: namaLengkap,
                              email: email,
                              noHp: noHP,
                              tanggalLahir: tanggalLahir,
                              jenisKelamin: selectedGender,
                              pendidikanTerakhir: pendidikanTerakhir,
                              pekerjaan: pekerjaan);

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return PengisianDataDiriSecond();
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
                      child: Text("Selanjutnya"),
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
