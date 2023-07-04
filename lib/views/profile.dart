import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uts/views/BottomNavBar.dart';
import 'package:uts/views/ProfileView.dart';
import 'package:uts/views/info.dart';
import 'package:uts/views/notifikasi.dart';
import 'package:uts/views/pesan.dart';
import 'package:uts/views/riwayatView.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedPage = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  Widget _buildPageContent() {
    switch (_selectedPage) {
      case 0:
        return ProfileView();
      case 1:
        return Notifikasi();
      case 2:
        return homePesan();
      case 3:
        return Info();
      default:
        return ProfileView();
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
