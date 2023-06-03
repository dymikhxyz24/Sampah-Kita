import 'package:flutter/material.dart';

import 'package:uts/main/dummyNotifikasi.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({super.key});

  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  void deleteAllItems() {
    setState(() {
      pesanData.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Semua pesan telah dihapus'),
        duration: Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesan"),
      ),
      body: ListView.builder(
        itemCount: pesanData.length,
        itemBuilder: (BuildContext context, int index) {
          {
            final item = pesanData[index].name;
            final description = pesanData[index].desc;
            return Dismissible(
              key: UniqueKey(),

              onDismissed: (direction) {
                setState(() {
                  pesanData.removeAt(index);
                });

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('$item telah dihapus'),
                  duration: Duration(milliseconds: 500),
                ));
              },
              // Show a red background as the item is swiped away.
              background: Container(color: Colors.green),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.black,
                            width: 0.5,
                            style: BorderStyle.solid))),
                child: ListTile(
                  title: Text(
                    item,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  subtitle: Text(description),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: deleteAllItems,
        child: Icon(Icons.delete),
      ),
    );
  }
}
