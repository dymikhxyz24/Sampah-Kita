import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<RegisterData>(context);
    // var prov1 = Provider.of<DataDiriProv>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Mitra"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Color(0xffff3bd77d),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.network(
              "https://cdn.discordapp.com/attachments/942624379735511100/1122850687991169104/man.png",
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/WhatsApp_icon.png/598px-WhatsApp_icon.png',
                  scale: 18,
                ),
                Text(
                  prov.userLogin['NoHp'] != "" ? prov.userLogin['NoHp'] : "",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            Text(
              prov.userLogin['Nama'],
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            Divider(
              thickness: 1,
              color: Color(0xffff3bd77d),
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Menjadi Anggota Sejak ${DateFormat("dd MMMM yyyy", "id_ID").format(DateTime.now())}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            Card(
              elevation: 10,
              margin: EdgeInsets.only(left: 20, right: 20, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        color: Color(0xffff3bd77d)),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Data Diri',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 20, left: 10, right: 5, bottom: 20),
                    height: 250,
                    decoration: BoxDecoration(color: Color(0xfffE2F1E4)),
                    child: ListView.separated(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Table(
                          columnWidths: {
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(2)
                          },
                          children: [
                            TableRow(children: [
                              TableCell(
                                child: Text(
                                  "Nama",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              TableCell(
                                child: Text(
                                  ":   ${prov.userLogin['Nama']}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              TableCell(
                                child: Text(
                                  ":   ${prov.userLogin['Email']}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: Text(
                                  "Pekerjaan",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              TableCell(
                                child: Text(
                                  prov.userLogin['Pekerjaan'] != ""
                                      ? ':   ${prov.userLogin['Pekerjaan']}'
                                      : ':   -',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: Text(
                                  "Pendidikan",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              TableCell(
                                child: Text(
                                  prov.userLogin['Pendidikan'] != ""
                                      ? ':   ${prov.userLogin['Pendidikan']}'
                                      : ':   -',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: Text(
                                  "Jenis Kelamin",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              TableCell(
                                child: Text(
                                  prov.userLogin['Jenis Kelamin'] != ""
                                      ? ':   ${prov.userLogin['Jenis Kelamin']}'
                                      : ':   -',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: Text(
                                  "Tanggal Lahir",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              TableCell(
                                child: Text(
                                  prov.userLogin['Tanggal Lahir'] != ""
                                      ? ':   ${prov.userLogin['Tanggal Lahir']}'
                                      : ':   -',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: Text(
                                  "Domisili",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              TableCell(
                                child: Text(
                                  prov.userLogin['Domisili'] != ""
                                      ? ':   ${prov.userLogin['Domisili']}'
                                      : ':   -',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ])
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10);
                      },
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
}
