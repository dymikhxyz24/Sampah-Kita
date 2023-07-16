import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../views/pengisianDataDiri2View.dart';

class PengisianDataDiri extends StatefulWidget {
  const PengisianDataDiri({super.key});

  @override
  State<PengisianDataDiri> createState() => _PengisianDataDiriState();
}

class _PengisianDataDiriState extends State<PengisianDataDiri> {
  TextEditingController namaPanggilanController = TextEditingController();
  TextEditingController namaLengkapController = TextEditingController();

  TextEditingController noHpController = TextEditingController();
  String tgllahirController = '';
  String? gender;
  String? pendidikanTerakhir;
  String? pekerjaan;

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
        tgllahirController = dateFormat.format(pickedDate);
      });
    }
  }

  DateTime? selectedDate;
  final dateFormat = DateFormat('dd MMMM yyyy');

  @override
  Widget build(BuildContext context) {
    // final prov = Provider.of<DataDiriProv>(context);
    var prov1 = Provider.of<RegisterData>(context);

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
                controller: namaPanggilanController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Nama Panggilan"),
                  filled: true,
                  fillColor: Colors.white,
                ),
                cursorColor: Colors.green,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: namaLengkapController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Nama Lengkap"),
                    filled: true,
                    fillColor: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: noHpController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("No HP"),
                    filled: true,
                    fillColor: Colors.white),
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
                              tgllahirController.isNotEmpty
                                  ? tgllahirController
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
                            value: "Pria",
                            groupValue: gender,
                            onChanged: (val) {
                              setState(() {
                                gender = val!;
                              });
                            },
                            activeColor: Colors.green,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                          ),
                          Text("L"),
                          Radio(
                            value: "Wanita",
                            groupValue: gender,
                            onChanged: (val) {
                              setState(() {
                                gender = val;
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
                        if (namaPanggilanController.text.isNotEmpty &&
                            namaLengkapController.text.isNotEmpty &&
                            noHpController.text.isNotEmpty &&
                            tgllahirController.isNotEmpty &&
                            gender!.isNotEmpty &&
                            pendidikanTerakhir!.isNotEmpty &&
                            pekerjaan!.isNotEmpty) {
                          prov1.updateUserData1(
                              namaPanggilanController.text.trim(),
                              namaLengkapController.text.trim(),
                              noHpController.text.trim(),
                              pekerjaan!.trim(),
                              pendidikanTerakhir!.trim(),
                              gender!.trim(),
                              tgllahirController.trim());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => PengisianDataDiriSecond()));
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
