import 'package:flutter/material.dart';

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
  // String _namaPanggilan = "";
  // String _namaLengkap = "";
  // String _email = "";
  // double _noHp = 0;
  // String _tanggalLahir = "";
  // String _jenisKelamin = "";
  // String _pendidikanTerakhir = "";
  // String _pekerjaan = "";

  // String _fotoKTP = "";
  // String _provinsi = "";
  // String _kota = "";
  // String _kecamatan = "";
  // String _kelurahan = "";
  // String _alamat = "";
  // double _kodePos = 0;

  String? namaPanggilan;
  String? namaLengkap;
  String? email;
  String? noHp;
  String? tanggalLahir;
  String? jenisKelamin;
  String? pendidikanTerakhir;
  String? pekerjaan;

  String? fotoKTP;
  String? provinsi;
  String? kota;
  String? kecamatan;
  String? kelurahan;
  String? alamat;
  String? kodePos;

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

  // String get namaPanggilan => _namaPanggilan;
  // String get namaLengkap => _namaLengkap;
  // String get email => _email;
  // double get noHp => _noHp;
  // String get tanggalLahir => _tanggalLahir;
  // String get jenisKelamin => _jenisKelamin;
  // String get pendidikanTerakhir => _pendidikanTerakhir;
  // String get pekerjaan => _pekerjaan;

  // String get fotoKTP => _fotoKTP;
  // String get provinsi => _provinsi;
  // String get kota => _kota;
  // String get kecamatan => _kecamatan;
  // String get kelurahan => _kelurahan;
  // String get alamat => _alamat;
  // double get kodePos => _kodePos;
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
