import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> data = {
      "Nama Lengkap": "M Shahwal Ramadhan Boger",
      "Email": "sawalalonso@gmail.com",
      "Pekerjaan": "Pelajar/Mahasiswa",
      "Pendidikan": "Sarjana",
      "Jenis Kelamin": "Laki-laki",
      "Tanggal Lahir": "20 Januari 2003",
      "Domisili": "Medan"
    };

    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Mitra"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Color(0xffff3bd77d),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Image.network(
            "https://cdn.discordapp.com/attachments/942624379735511100/1122850687991169104/man.png",
            height: 100,
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 100, right: 100),
            leading: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/WhatsApp_icon.png/598px-WhatsApp_icon.png",
              height: 30,
            ),
            title: Text(
              "088876541239",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            "M Shahwal Ramadhan Boger",
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
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
                  padding: EdgeInsets.all(20),
                  height: 250,
                  decoration: BoxDecoration(color: Color(0xfffE2F1E4)),
                  child: ListView.separated(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      String? key = data.keys.elementAt(index);
                      String? value = data[key];
                      return Table(
                        columnWidths: {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(2)
                        },
                        children: [
                          TableRow(children: [
                            TableCell(
                              child: Text(
                                key,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ),
                            TableCell(
                              child: Text(
                                ":\t ${value}",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
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
    );
  }
}
