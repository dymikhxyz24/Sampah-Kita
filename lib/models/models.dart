class jenisBeratModel {
  String jenisSampah;
  String beratSampah;

  jenisBeratModel({
    required this.jenisSampah,
    required this.beratSampah,
  });
}

class riwayatTransaksi {
  String nama;
  String berat;
  String tanggal;
  String harga;

  riwayatTransaksi({
    required this.nama,
    required this.berat,
    required this.tanggal,
    required this.harga,
  });
}

class dataDiri {
  String namaPanggilan;
  String namaLengkap;
  String email;
  double noHp;
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
  double kodePos;

  dataDiri({
    required this.namaPanggilan,
    required this.namaLengkap,
    required this.email,
    required this.noHp,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.pendidikanTerakhir,
    required this.pekerjaan,
    required this.fotoKTP,
    required this.provinsi,
    required this.kota,
    required this.kecamatan,
    required this.kelurahan,
    required this.alamat,
    required this.kodePos,
  });
}
