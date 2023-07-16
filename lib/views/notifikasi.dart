import 'package:flutter/material.dart';
import '../data/dummyNotifikasi.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({super.key});

  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  void deleteAllItems() {
    setState(() {
      notifData.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Semua notif telah dihapus'),
        duration: Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifikasi"),
        centerTitle: true,
        backgroundColor: Color(0xffff3BD77D),
      ),
      body: ListView.builder(
        itemCount: notifData.length,
        itemBuilder: (BuildContext context, int index) {
          {
            final item = notifData[index].nameNotif;
            final description = notifData[index].descNotif;
            return Dismissible(
              key: UniqueKey(),

              onDismissed: (direction) {
                setState(() {
                  notifData.removeAt(index);
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
        backgroundColor: Color(0xffff3bd77d),
        onPressed: deleteAllItems,
        child: Icon(Icons.delete),
      ),
    );
  }
}
