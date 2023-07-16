import 'package:flutter/material.dart';
import '../views/Dashboard.dart';

class VerifikasiLangganan extends StatefulWidget {
  const VerifikasiLangganan({super.key});

  @override
  State<VerifikasiLangganan> createState() => _VerifikasiLanggananState();
}

class _VerifikasiLanggananState extends State<VerifikasiLangganan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verifikasi"),
        leading: Container(),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Color(0xffff3bd77d),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            color: Color(0xffffb7fb82),
            elevation: 2,
            child: SizedBox(
              height: 160,
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
                      "Kami akan melakukan proses verifikasi\n\t\t\t\t\t\tterhadap data yang Anda berikan.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 100),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
              child: Text(
                "Halaman Utama",
                style: TextStyle(color: Colors.black),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size(50, 50)),
                backgroundColor: MaterialStatePropertyAll(Color(0xffffb7fb82)),
                shadowColor: MaterialStatePropertyAll(Colors.green),
              ))
        ],
      ),
    );
  }
}
