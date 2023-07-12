import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts/providers/providers.dart';
import 'package:uts/views/CustomButton.dart';
import 'package:uts/views/Dashboard.dart';
import 'package:uts/views/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final RegExp _emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})\s*$',
  );

  bool _showErrorEmail = false;
  bool _showErrorPassword = false;
  bool isChecked = false;
  bool _showPassword = false;
  String wrongLogin = "";
  bool _email = false;
  bool _pass = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void _validateInput() {
    setState(() {
      _showErrorEmail = !_emailRegex.hasMatch(emailController.text);
      _showErrorPassword = passwordController.text.length < 6;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<RegisterData>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        automaticallyImplyLeading: false,
        centerTitle: true,
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
                  label: Text("Masukkan Password")),
            ),
          ),
          Text(
            wrongLogin,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
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
                  if (emailController.text.isEmpty &&
                      passwordController.text.isEmpty) {
                    setState(() {
                      _email = true;
                      _pass = true;
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
                  var login =
                      (prov.userData['user'] as List<Map<String, String>>).any(
                          (user) =>
                              emailController.text != user['Email'] &&
                              passwordController.text != user['Password']);
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty &&
                      login) {
                    setState(() {
                      wrongLogin =
                          "Informasi Login yang dimasukkan salah, Harap perhatikan penulisan!";
                    });
                  }
                  if (prov.login(emailController.text.trim(),
                      passwordController.text.trim())) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => Dashboard()));
                    // print(prov.userLogin['Nama']);
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
