import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uts/data/dummyPesan.dart';

class pesanPage extends StatefulWidget {
  const pesanPage({super.key});

  @override
  State<pesanPage> createState() => _pesanPageState();
}

class _pesanPageState extends State<pesanPage> {
  final TextEditingController _textEditingController = TextEditingController();
  void _sendMessage() {
    if (_textEditingController.text.isEmpty) {
      return;
    }

    setState(() {
      final now = DateTime.now();

      pesan.add(
        pesanPesan(
          pengirim: "Shawal",
          isiPesan: _textEditingController.text,
          type: "User",
          timestamp: now,
        ),
      );
      _textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesan"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: pesan.length,
                itemBuilder: (BuildContext context, int index) {
                  final message = pesan[index];
                  final formattedTime =
                      DateFormat.jm().format(message.timestamp);
                  return Container(
                    alignment: message.type == "User"
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: message.type == "User"
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          message.pengirim,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          margin: EdgeInsets.only(top: 4.0),
                          decoration: BoxDecoration(
                            color: message.type == "User"
                                ? Colors.lightBlue
                                : Colors.green,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            message.isiPesan,
                            style: TextStyle(
                              color: message.type == "User"
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          formattedTime,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Divider(height: 1.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: Colors.black,
                          width: 0.5,
                          style: BorderStyle.solid))),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: "Ketikkan Pesan",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
