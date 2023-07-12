import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class JadwalBerlangganan extends StatelessWidget {
  const JadwalBerlangganan({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<DataBerlanggananProv>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Berlangganan"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Color(0xffff3bd77d),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SizedBox(
          width: 400,
          height: 400,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Text(
                  "Jadwal Pengambilan Sampah",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          List<String> jadwalList =
                              jadwalLanggananGenerate(prov.langkah!);
                          return ListTile(
                            contentPadding: EdgeInsets.only(left: 65),
                            leading: Icon(Icons.circle,
                                color: Color(0xffff3bd77d), size: 45),
                            title: Text(jadwalList[index]),
                            subtitle: Text(
                              "Jadwal Pengambilan",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          );
                        },
                        itemCount: 4))
              ],
            ),
            elevation: 10,
          ),
        ),
      ),
    );
  }

  List<String> jadwalLanggananGenerate(int langkah) {
    final dateFormat = DateFormat("EEEE, dd MMMM y", "id_ID");
    List<String> hariList = [];
    DateTime hariIni = DateTime.now();

    hariList.add(dateFormat.format(hariIni));

    for (int i = 0; i < 3; i++) {
      hariIni = hariIni.add(Duration(days: langkah));
      hariList.add(dateFormat.format(hariIni));
    }

    return hariList;
  }
}
