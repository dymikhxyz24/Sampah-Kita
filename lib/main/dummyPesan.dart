import 'package:intl/intl.dart';

class pesanPesan {
  final String pengirim;
  final String isiPesan;
  final String type;
  DateTime timestamp;

  pesanPesan({
    required this.pengirim,
    required this.isiPesan,
    required this.type,
    required this.timestamp,
  });
}

final now = DateTime.now();
final formattedTime = DateFormat.jm().format(now);

List<pesanPesan> pesan = [
  pesanPesan(
    pengirim: "Shawal",
    isiPesan: "Hello!",
    type: "User",
    timestamp: now,
  ),
  pesanPesan(
    pengirim: "Dida",
    isiPesan: "Hi, how are you?",
    type: "Staff",
    timestamp: now,
  ),
];
