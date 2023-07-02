import 'package:flutter/material.dart';

class GantiPassword extends StatefulWidget {
  const GantiPassword({Key? key}) : super(key: key);

  @override
  State<GantiPassword> createState() => _GantiPasswordState();
}

class _GantiPasswordState extends State<GantiPassword> {
  final TextEditingController _passwordLamaController = TextEditingController();
  final TextEditingController _passwordBaruController = TextEditingController();
  final TextEditingController _konfirmasiPasswordController =
      TextEditingController();

  bool _showPasswordLama = false;
  bool _showPasswordBaru = false;
  bool _showKonfirmasiPassword = false;

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
                _passwordLamaController.clear();
                _passwordBaruController.clear();
                _konfirmasiPasswordController.clear();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ganti Password", textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Color(0xffff3bd77d),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Divider(
              thickness: 1,
              color: Color(0xffff3bd77d),
              height: 30,
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _passwordLamaController,
                      obscureText: !_showPasswordLama,
                      decoration: InputDecoration(
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
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _passwordBaruController,
                      obscureText: !_showPasswordBaru,
                      decoration: InputDecoration(
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
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _konfirmasiPasswordController,
                      obscureText: !_showKonfirmasiPassword,
                      decoration: InputDecoration(
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
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String passwordLama = _passwordLamaController.text;
                String passwordBaru = _passwordBaruController.text;
                String konfirmasiPassword = _konfirmasiPasswordController.text;

                if (passwordLama.isNotEmpty &&
                    passwordBaru.isNotEmpty &&
                    konfirmasiPassword.isNotEmpty &&
                    passwordBaru == konfirmasiPassword) {
                  // Password berhasil diperbarui
                  _showSuccessDialog();
                } else {
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
    );
  }
}
