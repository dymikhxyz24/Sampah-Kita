import 'package:flutter/material.dart';
import 'package:uts/views/info.dart';

import 'package:uts/views/login.dart';
import 'package:uts/views/notifikasi.dart';
import 'package:uts/views/pesan.dart';
import 'package:uts/views/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(
      {super.key, required this.selectedPage, required this.onTap});
  final int selectedPage;
  final Function(int) onTap;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedPage,
      onTap: widget.onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.green,
      selectedItemColor: Colors.white,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
            backgroundColor: Colors.green),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifikasi",
            backgroundColor: Colors.green),
        BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Pesan",
            backgroundColor: Colors.green),
        BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Info",
            backgroundColor: Color.fromARGB(121, 255, 7, 7))
      ],
    );
  }
}
