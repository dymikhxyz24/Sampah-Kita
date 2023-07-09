import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  TextEditingController _tfnama = TextEditingController();
  TextEditingController _tfemail = TextEditingController();
  TextEditingController _tfpass = TextEditingController();
  TextEditingController _tfrepass = TextEditingController();

  TextEditingController get tfname => _tfnama;
  TextEditingController get tfemail => _tfemail;
  TextEditingController get tfpass => _tfpass;
  TextEditingController get tfrepass => _tfrepass;

  bool _isNameEmpty = false;
  bool _isemailEmpty = false;
  bool _ispassEmpty = false;
  bool _isrepassEmpty = false;

  bool get isNameEmpty => _isNameEmpty;
  bool get isemailEmpty => _isemailEmpty;
  bool get ispassEmpty => _ispassEmpty;
  bool get isrepassEmpty => _isrepassEmpty;

  set setNameEmpty(value) {
    _isNameEmpty = value;
    notifyListeners();
  }

  set setemailEmpty(value) {
    _isemailEmpty = value;
    notifyListeners();
  }

  set setpassEmpty(value) {
    _ispassEmpty = value;
    notifyListeners();
  }

  set setrepassEmpty(value) {
    _isrepassEmpty = value;
    notifyListeners();
  }
}

// class DataRegister extends ChangeNotifier {
//   String regNama = '';
//   String regEmail = '';
//   String  = '';
//   String regNama = '';
//   String regNama = '';
//   String regNama = '';
//   String regNama = '';
// }
