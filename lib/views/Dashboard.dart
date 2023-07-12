import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uts/views/BottomNavBar.dart';
import 'package:uts/views/DashboardView.dart';
import 'package:uts/views/Info.dart';
import 'package:uts/views/Notifikasi.dart';
import 'package:uts/views/pesan.dart';
import 'package:uts/views/riwayatView.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedPage = 0;
  var page;
  void _onTabTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedPage == 0) {
      page = DashboardView();
    }
    if (_selectedPage == 1) {
      page = Notifikasi();
    }
    if (_selectedPage == 2) {
      page = homePesan();
    }
    if (_selectedPage == 3) {
      page = Info();
    }

    return Scaffold(
      body: page,
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavBar(
          selectedPage: _selectedPage,
          onTap: _onTabTapped,
        ),
      ),
    );
  }
}
