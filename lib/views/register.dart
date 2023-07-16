import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../views/Login.dart';
import '../views/CustomButton.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  final RegExp _emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})\s*$',
  );

  var activeColor = Colors.green;
  bool _isChecked = false;
  bool _showErrorNama = false;
  bool _showErrorEmail = false;
  bool _showPassword = false;
  bool _showrePassword = false;
  bool _showErrorPassword = false;
  bool _showErrorrePassword = false;

  bool _nama = false;
  bool _email = false;
  bool _pass = false;
  bool _repass = false;

  void _validateInput() {
    setState(() {
      _showErrorNama = namaController.text.length < 4;
      _showErrorEmail = !_emailRegex.hasMatch(emailController.text);
      _showErrorPassword = passwordController.text.length < 6;
      _showErrorrePassword = repasswordController.text.length < 6;
    });
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<RegisterData>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xffff3BD77D),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color(0xffffB7FB83),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
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
                // autofocus: true,
                controller: namaController,
                onChanged: (_) => _validateInput(),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    errorText: _nama
                        ? (namaController.text.isEmpty
                            ? "Nama Tidak Boleh Kosong"
                            : _showErrorNama
                                ? 'Nama harus min. 4 huruf'
                                : null)
                        : null,
                    label: Text("Masukkan Nama")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                onChanged: (_) => _validateInput(),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    errorText: _email
                        ? (emailController.text.isEmpty
                            ? "E-mail Tidak Boleh Kosong"
                            : _showErrorEmail
                                ? "Format email salah"
                                : null)
                        : null,
                    label: Text("Masukkan E-mail")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                autocorrect: false,
                enableSuggestions: false,
                obscureText: !_showPassword,
                controller: passwordController,
                onChanged: (_) => _validateInput(),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        icon: Icon(_showPassword
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    errorText: _pass
                        ? (passwordController.text.isEmpty
                            ? "Password Tidak Boleh Kosong"
                            : _showErrorPassword
                                ? "Password harus min. 6 karakter"
                                : null)
                        : null,
                    label: Text("Buat Password")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                autocorrect: false,
                enableSuggestions: false,
                obscureText: !_showrePassword,
                controller: repasswordController,
                onChanged: (_) => _validateInput(),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showrePassword = !_showrePassword;
                        });
                      },
                      icon: Icon(_showrePassword
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  errorText: _repass
                      ? (repasswordController.text.isEmpty
                          ? "Konfirmasi Password Tidak Boleh Kosong"
                          : _showErrorrePassword
                              ? "Konfirmasi Password harus min. 6 karakter"
                              : repasswordController.text !=
                                      passwordController.text
                                  ? "Konfirmasi Password harus sama dengan Password diatas"
                                  : null)
                      : null,
                  label: Text("Konfirmasi Password"),
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Checkbox(
                side: BorderSide(color: activeColor, width: 2),
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value!;
                    activeColor = Colors.green;
                  });
                },
              ),
              Text("Saya Setuju dengan"),
              Text(
                "Terms of Service",
                style: TextStyle(color: Colors.green),
              ),
            ]),
            ElevatedButton(
                style: buttonprimary,
                onPressed: () {
                  String nama = namaController.text.trim();
                  String email = emailController.text.trim();
                  String password = passwordController.text.trim();

                  if (namaController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty &&
                      repasswordController.text.isNotEmpty &&
                      _isChecked &&
                      !_showErrorNama &&
                      !_showErrorEmail &&
                      !_showErrorPassword &&
                      !_showErrorrePassword) {
                    prov.addUser(nama, email, password);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Login()));
                  }
                  if (namaController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      repasswordController.text.isEmpty) {
                    setState(() {
                      _nama = true;
                      _email = true;
                      _pass = true;
                      _repass = true;
                    });

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text("Form tidak boleh kosong"),
                          actions: [
                            TextButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                  if (!_isChecked) {
                    setState(() {
                      activeColor = Colors.red;
                    });
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
      ),
    );
  }
}
