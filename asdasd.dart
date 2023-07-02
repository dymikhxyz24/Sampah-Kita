import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PengelolaanView extends StatefulWidget {
  const PengelolaanView({super.key});

  @override
  State<PengelolaanView> createState() => _PengelolaanViewState();
}

class _PengelolaanViewState extends State<PengelolaanView> {
  String imageFile = "Filename.jpg";

  void openFiles() async {
    FilePickerResult? resulFile =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (resulFile != null) {
      PlatformFile file = resulFile.files.first;
      setState(() {
        imageFile = file.name.toString();
      });
    } else {
      print("wkwk");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengelolaan"),
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
            subtitle: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      openFiles();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Colors.black, width: 1)),
                      ),
                      child: Text("Upload File"),
                    ),
                  ),
                  Container(
                    width: 250,
                    alignment: Alignment.center,
                    child: Text(
                      imageFile,
                      style: TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text("Keterangan"),
            subtitle: TextFormField(
              maxLines: 100,
            ),
          )
        ],
      ),
    );
  }
}
