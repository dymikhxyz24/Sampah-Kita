import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:uts/main/listpesan.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({super.key});

  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  // final items = List<String>.generate(5, (i) => 'Pesan Ke ${i + 1}');
  List<Pesan> trashCan = [];
  bool isAnyChecked = false;
  bool checkedState = false;
  existsInTrashCan(Pesan pesan) => trashCan.contains(pesan);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: trashCan.isEmpty
          ? AppBar(
              title: Text("Notifikasi"),
            )
          : AppBar(
              backgroundColor: Color.fromARGB(255, 58, 132, 61),
              leading: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      trashCan.clear();
                      pesanData.forEach((pesan) => pesan.checked = false);
                    });
                  }),
              title: Text(trashCan.length.toString()),
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        int deletedCount = trashCan.length;

                        pesanData
                            .removeWhere((item) => trashCan.contains(item));
                        trashCan.clear();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$deletedCount item(s) deleted'),
                            duration: Duration(milliseconds: 1500),
                          ),
                        );
                      });
                    },
                    icon: Icon(Icons.delete))
              ],
            ),
      body: ListView.builder(
        itemCount: pesanData.length,
        itemBuilder: (BuildContext context, int index) {
          {
            final item = pesanData[index].name;
            final Pesan pesan = pesanData[index];

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
                    color: pesan.checked ? Color.fromARGB(44, 0, 0, 0) : null,
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
                  onTap: () {
                    if (pesan.checked) {
                      setState(() {
                        pesan.checked = false;
                        trashCan.remove(pesan);
                      });
                    } else {
                      if (checkedState) {
                        setState(() {
                          pesan.checked = true;
                          trashCan.add(pesan);
                        });
                      }
                    }
                  },
                  onLongPress: () {
                    setState(() {
                      pesan.checked = !pesan.checked;
                      checkedState = true;
                      if (pesan.checked) {
                        trashCan.add(pesan);
                      } else {
                        trashCan.remove(pesan);
                      }
                    });
                  },
                ),
              ),
              // child: ListTile(
              //   title: Text(
              //     item,
              //     style: TextStyle(decoration: TextDecoration.underline),
              //   ),
              // ),
            );
          }
        },
      ),
    );
  }
}
