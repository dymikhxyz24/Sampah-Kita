import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts/providers/providers.dart';

class thanks extends StatefulWidget {
  const thanks({Key? key}) : super(key: key);

  @override
  State<thanks> createState() => _thanksState();
}

class _thanksState extends State<thanks> with TickerProviderStateMixin {
  late final AnimationController _thankscontroller = AnimationController(
    duration: const Duration(seconds: 2),
    reverseDuration: Duration(seconds: 2),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _thankscontroller,
    curve: Curves.fastEaseInToSlowEaseOut,
  );
  bool _isVisible = true;

  @override
  void dispose() {
    _thankscontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<PengelolaanProv>(context);
    return SizeTransition(
      sizeFactor: _animation,
      axis: Axis.vertical,
      axisAlignment: 0,
      child: Visibility(
          visible: _isVisible,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 8,
            color: Colors.green,
            shadowColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: Row(
                children: [
                  Container(
                    height: 120,
                    color: Colors.green,
                    child: Image.network(
                        width: 100,
                        height: 100,
                        'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExOWFvYTR2dTl3YXE1YXR0MDdvcHo5eHVmcDY1cWVzZDd5emZrdzhhZSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/WrbcG5CQkW3euphBHv/giphy.gif'),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        "Terima Kasih sudah memanggil kami!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        "Apakah sampahnya sudah dibuang?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.green,
                                backgroundColor: Colors.white),
                            onPressed: () {
                              setState(() {
                                _thankscontroller.reverse();

                                Timer(Duration(seconds: 3), () {
                                  _isVisible = false;
                                  prov.setTanggalPengambilan("");
                                });
                              });
                            },
                            child: Text(
                              "Sudah",
                              style: TextStyle(fontSize: 18),
                            )),
                      )
                    ],
                  ))
                ],
              ),
            ),
          )),
    );
  }
}
