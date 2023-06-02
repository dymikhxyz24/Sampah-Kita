class Pesan {
  final String id;
  final String name;
  bool checked;

  Pesan({required this.id, required this.name, this.checked = false});
}

final items = List<String>.generate(5, (i) => 'Pesan Ke ${i + 1}');

List<Pesan> pesanData = items.asMap().entries.map((entry) {
  final index = entry.key;
  final name = entry.value;
  final id = (index + 1).toString();
  return Pesan(id: id, name: name);
}).toList();
