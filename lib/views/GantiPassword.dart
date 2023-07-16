import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class GantiPassword extends StatefulWidget {
  const GantiPassword({Key? key}) : super(key: key);

  @override
  State<GantiPassword> createState() => _GantiPasswordState();
}

class _GantiPasswordState extends State<GantiPassword> {
  final TextEditingController passwordLamaController = TextEditingController();
  final TextEditingController passwordBaruController = TextEditingController();
  final TextEditingController konfirmasiPasswordController =
      TextEditingController();
  var alert = '';
  bool _showPasswordLama = false;
  bool _showPasswordBaru = false;
  bool _showKonfirmasiPassword = false;
  bool _oldPass = false;

  bool _pass = false;
  bool _repass = false;
  bool _showErroroldPassword = false;

  bool _showErrorPassword = false;
  bool _showErrorrePassword = false;

  void _validateInput() {
    setState(() {
      _showErroroldPassword = passwordLamaController.text.length < 6;
      _showErrorPassword = passwordBaruController.text.length < 6;
      _showErrorrePassword = konfirmasiPasswordController.text.length < 6;
    });
  }

  @override
  void dispose() {
    passwordBaruController.dispose();
    konfirmasiPasswordController.dispose();
    super.dispose();
  }

  Future<void> _showSuccessDialog() async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Password Berhasil Diperbarui'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                passwordLamaController.clear();
                passwordBaruController.clear();
                konfirmasiPasswordController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<RegisterData>(context);
    int idxDataSet = prov.userData['user']
        .indexWhere((user) => user['Email'] == prov.userLogin['Email']);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ganti Password", textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Color(0xffff3bd77d),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Divider(
                thickness: 1,
                color: Color(0xffff3bd77d),
                height: 30,
              ),
              Text(
                alert,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: passwordLamaController,
                        onChanged: (_) => _validateInput(),
                        obscureText: !_showPasswordLama,
                        decoration: InputDecoration(
                          errorText: _oldPass
                              ? (passwordLamaController.text.isEmpty
                                  ? "Password Tidak Boleh Kosong"
                                  : _showErroroldPassword
                                      ? "Password harus min. 6 karakter"
                                      : null)
                              : null,
                          contentPadding: EdgeInsets.all(20),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Password Lama',
                          hintText: 'Masukkan password lama',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showPasswordLama
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _showPasswordLama = !_showPasswordLama;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: passwordBaruController,
                        onChanged: (_) => _validateInput(),
                        obscureText: !_showPasswordBaru,
                        decoration: InputDecoration(
                          errorText: _pass
                              ? (passwordBaruController.text.isEmpty
                                  ? "Password Tidak Boleh Kosong"
                                  : _showErrorPassword
                                      ? "Password harus min. 6 karakter"
                                      : null)
                              : null,
                          contentPadding: EdgeInsets.all(20),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Password Baru',
                          hintText: 'Masukkan password baru',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showPasswordBaru
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _showPasswordBaru = !_showPasswordBaru;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: konfirmasiPasswordController,
                        onChanged: (_) => _validateInput(),
                        obscureText: !_showKonfirmasiPassword,
                        decoration: InputDecoration(
                          errorText: _repass
                              ? (konfirmasiPasswordController.text.isEmpty
                                  ? "Konfirmasi Password Tidak Boleh Kosong"
                                  : _showErrorrePassword
                                      ? "Konfirmasi Password harus min. 6 karakter"
                                      : konfirmasiPasswordController.text !=
                                              passwordBaruController.text
                                          ? "Konfirmasi Password harus sama dengan Password diatas"
                                          : null)
                              : null,
                          contentPadding: EdgeInsets.all(20),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Konfirmasi Password Baru',
                          hintText: 'Konfirmasi password baru',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showKonfirmasiPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _showKonfirmasiPassword =
                                    !_showKonfirmasiPassword;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String passwordLama = passwordLamaController.text;
                  String passwordBaru = passwordBaruController.text;
                  String konfirmasiPassword = konfirmasiPasswordController.text;

                  if (passwordLama.isNotEmpty &&
                      passwordBaru.isNotEmpty &&
                      konfirmasiPassword.isNotEmpty &&
                      passwordLama == prov.userLogin['Password'] &&
                      passwordBaru != passwordLama &&
                      passwordBaru == konfirmasiPassword) {
                    prov.updatePassword(idxDataSet, passwordBaru);
                    _showSuccessDialog();
                    setState(() {
                      _oldPass = false;
                      _pass = false;
                      _repass = false;
                    });
                  }
                  if (passwordLama.isNotEmpty &&
                      passwordBaru.isNotEmpty &&
                      konfirmasiPassword.isNotEmpty &&
                      passwordLama == passwordBaru &&
                      passwordBaru == prov.userLogin['Password']) {
                    setState(() {
                      alert =
                          'Password Baru tidak boleh sama dengan Password Lama';
                    });
                  }
                  if (passwordLama.isNotEmpty &&
                      passwordBaru.isNotEmpty &&
                      konfirmasiPassword.isNotEmpty &&
                      passwordBaru != konfirmasiPassword) {
                    setState(() {
                      alert =
                          'Konfirmasi Password harus sama dengan Password Baru';
                    });
                  } else if (passwordLama.isEmpty ||
                      passwordBaru.isEmpty ||
                      konfirmasiPassword.isEmpty) {
                    setState(() {
                      _oldPass = true;
                      _pass = true;
                      _repass = true;
                    });
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Gagal'),
                          content: Text(
                              'Harap isi password jika ingin mengubah password'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffff3bd77d),
                  minimumSize: Size(200, 50),
                  padding: EdgeInsets.all(12),
                  fixedSize: Size(200, 50),
                ),
                child: Text(
                  'Ganti',
                  style: TextStyle(
                    fontFamily: 'KaiseiTokumin',
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
