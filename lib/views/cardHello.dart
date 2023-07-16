import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class hello extends StatefulWidget {
  const hello({super.key});

  @override
  State<hello> createState() => _helloState();
}

class _helloState extends State<hello> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastEaseInToSlowEaseOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<RegisterData>(context);
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
          color: Color(0xffff3BD77D),
          shadowColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: [
                Container(
                  height: 120,
                  // color: Color(0xffff3BD77D),
                  child: Image.network(
                      width: 100,
                      height: 100,
                      'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExdGhqcHBvc3JsZ2J4Mm8xYjFvdWphZHBhZjF4MTgybWZ3ejdkN21zdyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/GHDrZ11Di8CrjInjT8/giphy.gif'),
                ),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      "Halo ${prov.userLogin['Nama']}!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Apakah kamu sudah siap untuk membuang sampah hari ini?",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
