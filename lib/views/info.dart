import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
        centerTitle: true,
        backgroundColor: Color(0xffff3bd77d),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Profil Sampah Kita",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                  image: NetworkImage(
                      "https://cdn.discordapp.com/attachments/972198684550897696/1113113994664878101/Group_17.png")),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                    '"Sampah Kita adalah sebuah aplikasi yang dirancang untuk memudahkan pengguna dalam memanfaatkan sampah dengan tiga fitur utama, yaitu edukasi, pengelolaan sampah, dan penjualan sampah.  Dengan aplikasi ini, pengguna dapat menjual sampah plastik dan lainnya yang akan dibayar per kg nya, yang kemudian diolah menjadi barang setengah jadi atau pelet plastik.')),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                    'Kami juga menyediakan layanan pengambilan sampah dari rumah pengguna dengan reward atas pengumpulan sampah yang telah dilakukan. Dalam pengelolaan sampah, pengguna hanya perlu memilah sampah plastik berdasarkan jenisnya menjadi organik atau anorganik. Kami juga memiliki fitur langganan bulanan yang memungkinkan pengguna untuk mendapatkan layanan pengambilan sampah dari rumah secara teratur dengan harga yang lebih terjangkau. ')),
          ]),
        ),
      ),
    );
  }
}
