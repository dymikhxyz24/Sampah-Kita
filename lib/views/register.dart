import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts/views/Login.dart';
import 'package:uts/providers/provider1.dart';
import 'package:uts/views/CustomButton.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Color.fromARGB(255, 183, 251, 131),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Daftar Akun Anda",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: prov.tfname,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  errorText:
                      prov.isNameEmpty ? "Nama Tidak Boleh Kosong" : null,
                  label: Text("Masukkan Nama")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: prov.tfemail,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  errorText:
                      prov.isemailEmpty ? "E-mail Tidak Boleh Kosong" : null,
                  label: Text("Masukkan E-mail")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              controller: prov.tfpass,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  errorText:
                      prov.ispassEmpty ? "Password Tidak Boleh Kosong" : null,
                  label: Text("Buat Password")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              controller: prov.tfrepass,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                errorText: prov.isrepassEmpty
                    ? "Konfirmasi Password Tidak Boleh Kosong"
                    : null,
                label: Text("Konfirmasi Password"),
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                }),
            Text("Saya Setuju dengan"),
            Text(
              "Terms of Service",
              style: TextStyle(color: Colors.green),
            ),
          ]),
          ElevatedButton(
              style: buttonprimary,
              onPressed: () {
                prov.setNameEmpty = prov.tfname.text.isEmpty;
                prov.setemailEmpty = prov.tfemail.text.isEmpty;
                prov.setpassEmpty = prov.tfpass.text.isEmpty;
                prov.setrepassEmpty = prov.tfrepass.text.isEmpty;

                if (!prov.ispassEmpty &&
                    !prov.isemailEmpty &&
                    !prov.isNameEmpty &&
                    !prov.isrepassEmpty &&
                    isChecked) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Login()));
                }
              },
              child: Text(
                "Daftar",
                style: TextStyle(fontSize: 17),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sudah punya akun ? Silahkan"),
              TextButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Login()));
                },
              )
            ],
          )
        ]),
      ),
    );
  }
}
