import 'package:flutter/material.dart';
import '../views/login.dart';
import '../views/profil.dart';
import './GantiPassword.dart';
import './KebijakanPrivasi.dart';

class SubProfil extends StatelessWidget {
  const SubProfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sampah Kita',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Color(0xffff3bd77d),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: Colors.grey),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Profil()));
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xffff3bd77d),
              minimumSize: Size(200, 50),
              padding: EdgeInsets.all(12),
              fixedSize: Size(200, 50),
            ),
            child: Text(
              'Profil',
              style: TextStyle(
                fontFamily: 'KaiseiTokumin',
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GantiPassword()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xffff3bd77d),
              minimumSize: Size(200, 50),
              padding: EdgeInsets.all(12),
              fixedSize: Size(200, 50),
            ),
            child: Text(
              'Ganti Password',
              style: TextStyle(
                fontFamily: 'KaiseiTokumin',
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Login()));
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xffff3bd77d),
              minimumSize: Size(200, 50),
              padding: EdgeInsets.all(12),
              fixedSize: Size(200, 50),
            ),
            child: Text(
              'Keluar',
              style: TextStyle(
                fontFamily: 'KaiseiTokumin',
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: Colors.grey),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KebijakanPrivasi()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xffff3bd77d),
              minimumSize: Size(200, 50),
              padding: EdgeInsets.all(12),
              fixedSize: Size(200, 50),
            ),
            child: Text(
              'Kebijakan Privasi',
              style: TextStyle(
                fontFamily: 'KaiseiTokumin',
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
