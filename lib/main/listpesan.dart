class Course {
  final String id;
  final String name;
  bool checked;

  Course({required this.id, required this.name, this.checked = false});
}

final items = List<String>.generate(5, (i) => 'Pesan Ke ${i + 1}');

List<Course> coursesData = items.asMap().entries.map((entry) {
  final index = entry.key;
  final name = entry.value;
  final id = (index + 1).toString();
  return Course(id: id, name: name);
}).toList();
