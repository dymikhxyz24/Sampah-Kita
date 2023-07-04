class Pesan {
  final String id;
  final String name;
  final String desc;
  bool checked;

  Pesan(
      {required this.id,
      required this.name,
      required this.desc,
      this.checked = false});
}

//dummy
final items = List<String>.generate(5, (i) => 'Pesan ${i + 1}');
final deskripsi =
    List<String>.generate(5, (i) => 'Deskripsi pesan ke ${i + 1}');

List<Pesan> pesanData = items.asMap().entries.map((entry) {
  final index = entry.key;
  final name = entry.value;
  final desc = deskripsi[index];
  final id = (index + 1).toString();
  return Pesan(id: id, name: name, desc: desc);
}).toList();

class Notifikasi {
  final String idNotif;
  final String nameNotif;
  final String descNotif;
  bool checked;

  Notifikasi(
      {required this.idNotif,
      required this.nameNotif,
      required this.descNotif,
      this.checked = false});
}

//dummy
final itemsNotif = List<String>.generate(5, (i) => 'Notifikasi ${i + 1}');
final deskripsiNotif =
    List<String>.generate(5, (i) => 'Deskripsi pesan ke ${i + 1}');

List<Notifikasi> notifData = itemsNotif.asMap().entries.map((entry) {
  final index = entry.key;
  final nameNotif = entry.value;
  final descNotif = deskripsiNotif[index];
  final idNotif = (index + 1).toString();
  return Notifikasi(
      idNotif: idNotif, nameNotif: nameNotif, descNotif: descNotif);
}).toList();
