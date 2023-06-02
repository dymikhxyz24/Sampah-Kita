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
  List<Course> trashCan = [];
  bool isAnyChecked = false;
  existsInTrashCan(Course course) => trashCan.contains(course);
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
                      coursesData.forEach((course) => course.checked = false);
                    });
                  }),
              title: Text(trashCan.length.toString()),
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        int deletedCount = trashCan.length;

                        coursesData
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
        itemCount: coursesData.length,
        itemBuilder: (BuildContext context, int index) {
          {
            final item = coursesData[index].name;
            final Course course = coursesData[index];

            return Dismissible(
              key: UniqueKey(),

              onDismissed: (direction) {
                setState(() {
                  coursesData.removeAt(index);
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
                    color: course.checked ? Color.fromARGB(44, 0, 0, 0) : null,
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
                    if (course.checked) {
                      setState(() {
                        course.checked = false;
                        trashCan.remove(course);
                      });
                    } else {
                      setState(() {
                        course.checked = true;
                        trashCan.add(course);
                      });
                    }
                  },
                  onLongPress: () {
                    setState(() {
                      course.checked = !course.checked;
                      if (course.checked) {
                        trashCan.add(course);
                      } else {
                        trashCan.remove(course);
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
