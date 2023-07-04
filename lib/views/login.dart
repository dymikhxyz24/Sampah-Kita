import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts/providers/provider1.dart';
import 'package:uts/views/CustomButton.dart';
import 'package:uts/views/Dashboard.dart';
import 'package:uts/views/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _SelectedRadio = "";
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
                  "Login ke Akun Anda",
                  style: TextStyle(fontSize: 15),
                ),
              ],
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
                  label: Text("Masukkan Password")),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Radio(
                value: "Simpan",
                groupValue: _SelectedRadio,
                onChanged: (value) {
                  setState(() {
                    _SelectedRadio = value!;
                  });
                }),
            Text("Simpan Info Login"),
            Text(
              "\tLupa Kata Sandi ?",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.w900),
            )
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Belum Mendaftar ?"),
              TextButton(
                child: Text("Buat Akun Baru"),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Register()));
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: buttonprimary,
                onPressed: () {
                  prov.setNameEmpty = prov.tfname.text.isEmpty;
                  prov.setemailEmpty = prov.tfemail.text.isEmpty;
                  prov.setpassEmpty = prov.tfpass.text.isEmpty;
                  prov.setrepassEmpty = prov.tfrepass.text.isEmpty;

                  if (!prov.ispassEmpty &&
                      !prov.isemailEmpty &&
                      !prov.isNameEmpty &&
                      !prov.isrepassEmpty) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Dashboard()));
                  }
                },
                child: Text(
                  "Masuk",
                  style: TextStyle(fontSize: 17),
                )),
          )
        ]),
      ),
    );
  }
}
