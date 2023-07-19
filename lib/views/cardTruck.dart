import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class onTheWay extends StatefulWidget {
  const onTheWay({Key? key}) : super(key: key);

  @override
  State<onTheWay> createState() => _onTheWayState();
}

class _onTheWayState extends State<onTheWay> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    reverseDuration: Duration(seconds: 2),
    vsync: this,
  )..forward();
  late final AnimationController _thankscontroller = AnimationController(
    duration: const Duration(seconds: 2),
    reverseDuration: Duration(seconds: 2),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastEaseInToSlowEaseOut,
  );
//////////////////////////////////////////////////////////////

  bool _isVisible = true;
  @override
  void initState() {
    print("initstate called");
    Timer(Duration(seconds: 30), () {
      _isVisible = false;
    });
    Timer(Duration(seconds: 28), () {
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _thankscontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<PengelolaanProv>(context);
    Timer(Duration(seconds: 34), () {
      prov.setStatusPengambilan("DONE");
      print(prov.statusPengambilan);
    });
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
            color: Color(0xffff3bd77d),
            shadowColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: Row(
                children: [
                  Container(
                    height: 120,
                    color: Color(0xffff3bd77d),
                    child: Image.network(
                        width: 100,
                        height: 100,
                        'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExenQzcnBxaTd0NThpd2dsaTV0dzVldWg3aXlmdWZvcTZseDd0cTgwbiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/B2JDysrCTuNLb5F1EI/giphy.gif'),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Truk Sampah sedang dalam perjalanan menuju tempatmu!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        "Persiapkan sampahmu agar truk tidak menunggu terlalu lama!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 16),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          )),
    );
  }
}
