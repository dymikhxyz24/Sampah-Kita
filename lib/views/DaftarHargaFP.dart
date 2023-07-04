import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:uts/views/DaftarHargaMain.dart';
import 'package:uts/data/dummyDaftarHarga.dart';

class DaftarHargaFP extends StatefulWidget {
  const DaftarHargaFP({Key? key}) : super(key: key);

  @override
  _DaftarHargaFPState createState() => _DaftarHargaFPState();
}

class _DaftarHargaFPState extends State<DaftarHargaFP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Daftar Harga'),
          centerTitle: true),
      body: Container(
        color: Colors.green[100],
        child: ListView.separated(
          itemCount: 6,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.orange[300],
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Estimasi biaya untuk material anorganik',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            } else if (index == 5) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DaftarHarga1()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    'Lihat Lebih Banyak',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }
            final priceItem = priceItems[index - 1];
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    child: Card(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Image.asset(
                              priceItem.image,
                              width: 80,
                              height: 80,
                            ),
                          ),
                          title: Text(
                            priceItem.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                priceItem.deskripsi,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                priceItem.price,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 8),
        ),
      ),
    );
  }
}
