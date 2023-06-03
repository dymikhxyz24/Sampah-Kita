import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:uts/main/dummyNotifikasi.dart';

class homePesan extends StatefulWidget {
  const homePesan({super.key});

  @override
  State<homePesan> createState() => _homePesanState();
}

class _homePesanState extends State<homePesan> {
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
              title: Text("Pesan"),
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
                            content: Text('$deletedCount pesan dihapus'),
                            duration: Duration(milliseconds: 500),
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
            final description = pesanData[index].desc;
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
                  subtitle: Text(description),
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
            );
          }
        },
      ),
    );
  }
}
