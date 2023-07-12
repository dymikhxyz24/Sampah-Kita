import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uts/views/cardHello.dart';

import 'package:uts/views/cardTruck.dart';

import '../models/models.dart';

class PengelolaanProv with ChangeNotifier {
  String _fotoSampah = 'silahkan unggah foto';
  String _keterangan = '';
  String _tanggalPengambilan = '';
  String _waktuPengambilan = '';
  String _lokasiPengambilan = '';
  double _lati = 0;
  double _long = 0;
  List<jenisBeratModel> _jenisBerat = [];

  String get fotoSampah => _fotoSampah;
  String get keterangan => _keterangan;
  String get tanggalPengambilan => _tanggalPengambilan;
  String get waktuPengambilan => _waktuPengambilan;
  String get lokasiPengambilan => _lokasiPengambilan;
  double get lati => _lati;
  double get long => _long;
  List<jenisBeratModel> get jenisBerat => _jenisBerat;
  void setFotoSampah(val) {
    _fotoSampah = val;
    notifyListeners();
  }

  void setKeterangan(val) {
    _keterangan = val;
    notifyListeners();
  }

  void setTanggalPengambilan(val) {
    _tanggalPengambilan = val;
    if (_tanggalPengambilan != '') {}
    notifyListeners();
  }

  void setWaktuPengambilan(val) {
    _waktuPengambilan = val;
    notifyListeners();
  }

  void setLokasiPengambilan(val) {
    _lokasiPengambilan = val;
    notifyListeners();
  }

  void setLatitude(val) {
    _lati = val;
    notifyListeners();
  }

  void setLongtitude(val) {
    _long = val;
    notifyListeners();
  }

  void tambahJenisBerat(jenis, berat) {
    _jenisBerat.add(jenisBeratModel(jenisSampah: jenis, beratSampah: berat));
    notifyListeners();
  }

  void ubahJenisBerat(idx, jenis, berat) {
    _jenisBerat[idx] = jenisBeratModel(jenisSampah: jenis, beratSampah: berat);
    notifyListeners();
  }
}

class DataDiriProv with ChangeNotifier {
  String namaPanggilan;
  String namaLengkap;
  String email;
  String noHp;
  String tanggalLahir;
  String jenisKelamin;
  String pendidikanTerakhir;
  String pekerjaan;

  String fotoKTP;
  String provinsi;
  String kota;
  String kecamatan;
  String kelurahan;
  String alamat;
  String kodePos;

  DataDiriProv({
    this.namaPanggilan = "",
    this.namaLengkap = "",
    this.email = "",
    this.noHp = "",
    this.tanggalLahir = "",
    this.jenisKelamin = "",
    this.pendidikanTerakhir = "",
    this.pekerjaan = "",
    this.fotoKTP = "",
    this.provinsi = "",
    this.kota = "",
    this.kecamatan = "",
    this.kelurahan = "",
    this.alamat = "",
    this.kodePos = "",
  });

  void updateData({
    String? namaPanggilan,
    String? namaLengkap,
    String? email,
    String? noHp,
    String? tanggalLahir,
    String? jenisKelamin,
    String? pendidikanTerakhir,
    String? pekerjaan,
    String? fotoKTP,
    String? provinsi,
    String? kota,
    String? kecamatan,
    String? kelurahan,
    String? alamat,
    String? kodePos,
  }) {
    this.namaPanggilan = namaPanggilan ?? this.namaPanggilan;
    this.namaLengkap = namaLengkap ?? this.namaLengkap;
    this.email = email ?? this.email;
    this.noHp = noHp ?? this.noHp;
    this.tanggalLahir = tanggalLahir ?? this.tanggalLahir;
    this.jenisKelamin = jenisKelamin ?? this.jenisKelamin;
    this.pendidikanTerakhir = pendidikanTerakhir ?? this.pendidikanTerakhir;
    this.pekerjaan = pekerjaan ?? this.pekerjaan;
    this.fotoKTP = fotoKTP ?? this.fotoKTP;
    this.provinsi = provinsi ?? this.provinsi;
    this.kota = kota ?? this.kota;
    this.kecamatan = kecamatan ?? this.kecamatan;
    this.kelurahan = kelurahan ?? this.kelurahan;
    this.alamat = alamat ?? this.alamat;
    this.kodePos = kodePos ?? this.kodePos;

    notifyListeners();
  }
}

class RegisterData extends ChangeNotifier {
  final _userData = {
    "user": [
      {
        "Nama Panggilan": "",
        "Nama": "M Shawal Ramadhan Boger",
        "Email": "sawalrever@gmail.com",
        "Password": "sawal123",
        "NoHp": "08124356721",
        "Pekerjaan": "",
        "Pendidikan": "",
        "Jenis Kelamin": "Laki-laki",
        "Tanggal Lahir": "20 Januari 2003",
        "Domisili": "Medan",
      },
      {
        "Nama Panggilan": "",
        "Nama": "M Shawal Ramadhan Boger2",
        "Email": "sawalrever@gmail.com2",
        "Password": "sawal1232",
        "NoHp": "08124356722",
        "Pekerjaan": "Pelajar/Mahasiswa2",
        "Pendidikan": "Sarjana2",
        "Jenis Kelamin": "Laki-laki2",
        "Tanggal Lahir": "20 Januari 20032",
        "Domisili": "Medan2",
      }
    ]
  };
  get userData => _userData;
  var userLogin;

  bool login(String nama, String password) {
    var dataLogin = (_userData['user'] as List<Map<String, String>>)
        .singleWhere(
            (user) => user['Email'] == nama && user['Password'] == password);
    userLogin = dataLogin;
    notifyListeners();
    return dataLogin.isNotEmpty;
  }

  void updateUserData1(
    String namaPanggilan,
    String nama,
    String noHp,
    String pekerjaan,
    String pendidikan,
    String gender,
    String tgllahir,
  ) {
    userLogin['Nama Panggilan'] = namaPanggilan;
    userLogin['Nama'] = nama;
    userLogin['noHp'] = noHp;
    userLogin['Pekerjaan'] = pekerjaan;
    userLogin['Pendidikan'] = pendidikan;
    userLogin['Gender'] = gender;
    userLogin['Tanggal Lahir'] = tgllahir;
    notifyListeners();
  }

  void updateUserData2(String domisili) {
    userLogin['Domisili'] = domisili;
    notifyListeners();
  }

  void updatePassword(String oldPassword, String newPassword) {
    if (oldPassword == userLogin['Password']) {
      userLogin['Password'] = newPassword;
    }
    notifyListeners();
  }

  void addUser(
    String nama,
    String email,
    String password,
  ) async {
    var data = userData['user'] as List<Map<String, String>>;
    data.add({
      "Nama": nama,
      "Email": email,
      "Password": password,
    });
    notifyListeners();
  }
}

class DataBerlanggananProv with ChangeNotifier {
  String? lokasiTPA;
  String? jadwalPenjemputan;
  int? langkah;

  DataBerlanggananProv({
    this.lokasiTPA = "",
    this.jadwalPenjemputan = "",
    this.langkah = 0,
  });

  void updateData({
    String? lokasiTPA,
    String? jadwalPenjemputan,
    int? langkah,
  }) {
    this.lokasiTPA = lokasiTPA ?? this.lokasiTPA;
    this.jadwalPenjemputan = jadwalPenjemputan ?? this.jadwalPenjemputan;
    this.langkah = langkah ?? this.langkah;
  }
}
