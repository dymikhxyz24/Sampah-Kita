import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  DateTime? _date;
  // var _date = DateTime.now();
  String? selectedValue;
  String _SelectedRadio = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'FORM PENDAFTARAN PASIEN BARU',
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 224, 255, 200),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            )
          ],
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(255, 224, 255, 200),
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Nama Pasien',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: DropdownButton(
                            hint: Text("Jenis Kelamin"),
                            isExpanded: true,
                            value: selectedValue,
                            items: [
                              DropdownMenuItem(
                                child: Text("Laki-Laki"),
                                value: "Laki - Laki",
                              ),
                              DropdownMenuItem(
                                child: Text("Perempuan"),
                                value: "Perempuan",
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                          ),
                        ),
                      )
                    ])),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            TextFormField(
                              initialValue:
                                  "${DateFormat.yMMMd().format(_date ?? DateTime.now())}",
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                labelText: 'Tanggal Lahir',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                filled: true,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: IconButton(
                                onPressed: () async {
                                  var res = await showDatePicker(
                                    context: context,
                                    initialDate: _date ?? DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2250),
                                  );
                                  if (res != null) {
                                    setState(() {
                                      _date = res;
                                    });
                                  }
                                },
                                icon: const Icon(Icons.date_range),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'No Telepon',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Alamat',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Pekerjaan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Imunisasi",
                      ),
                      Row(children: [
                        Radio(
                          value: "Belum",
                          groupValue: _SelectedRadio,
                          onChanged: (value) {
                            setState(() {
                              _SelectedRadio = value!;
                            });
                          },
                          activeColor: Colors.black,
                        ),
                        Text("Belum"),
                        Radio(
                          value: "Sudah",
                          groupValue: _SelectedRadio,
                          onChanged: (value) {
                            setState(() {
                              _SelectedRadio = value!;
                            });
                          },
                          activeColor: Colors.black,
                        ),
                        Text("Sudah"),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: InputDatePickerFormField(
                        fieldLabelText: "Tanggal Berkunjung",
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2250),
                        onDateSubmitted: (date) {
                          setState(() {
                            _date = date;
                            print(_date);
                          });
                        },
                      )),
                      IconButton(
                          onPressed: () async {
                            var res = await showDatePicker(
                                context: context,
                                initialDate: _date ?? DateTime.now(),
                                firstDate: DateTime(1990),
                                lastDate: DateTime(2250));
                            if (res != null) {
                              setState(() {
                                _date = res;
                              });
                            }
                          },
                          icon: const Icon(Icons.date_range))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Alergi',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Anamnesa',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Diagnosa',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Therapy',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.centerRight,
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      elevation: 5,
                    ),
                    child: Text('Selesai'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
