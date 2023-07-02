import 'package:flutter/material.dart';
import '../views/pengisianDataDiriView.dart';

class LangganganView extends StatefulWidget {
  const LangganganView({super.key});

  @override
  State<LangganganView> createState() => _LangganganViewState();
}

class _LangganganViewState extends State<LangganganView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Langganan"),
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
              height: 150,
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
                      "Jangan lupa untuk melengkapi data diri Anda agar bisa mengakses fitur langganan yang kami sediakan.",
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
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color(0xffffb7fb82),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
            child: Text(
              "Lengkapi Data Diri",
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PengisianDataDiri();
              }));
            },
          ),
          Divider(
            thickness: 1,
            color: Colors.black,
            indent: 30,
            endIndent: 30,
          )
        ],
      ),
    );
  }
}
