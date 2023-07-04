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

  void _onTabTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  Widget _buildPageContent() {
    switch (_selectedPage) {
      case 0:
        return DashboardView();
      case 1:
        return Notifikasi();
      case 2:
        return homePesan();
      case 3:
        return Info();
      default:
        return DashboardView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(),
      bottomNavigationBar: BottomNavBar(
        selectedPage: _selectedPage,
        onTap: _onTabTapped,
      ),
    );
  }
}
