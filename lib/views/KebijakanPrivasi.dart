import 'package:flutter/material.dart';

class KebijakanPrivasi extends StatefulWidget {
  const KebijakanPrivasi({Key? key}) : super(key: key);

  @override
  State<KebijakanPrivasi> createState() => _KebijakanPrivasiState();
}

class _KebijakanPrivasiState extends State<KebijakanPrivasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff3bd77d),
        title: const Text("Kebijakan Privasi", textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 2, // Tinggi garis pemisah
                  color: Colors.green, // Warna garis pemisah
                ),
                SizedBox(height: 10),
                Card(
                  color: Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Kebijakan Privasi Aplikasi Sampah Kita',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Aplikasi Pengelolaan Sampah menghargai privasi pengguna dan berkomitmen untuk melindungi informasi pribadi yang dikumpulkan dari pengguna. Kami mengambil langkah-langkah yang wajar untuk memastikan bahwa informasi pribadi yang dikumpulkan dan digunakan hanya sebagaimana dijelaskan dalam Kebijakan Privasi ini.',
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Informasi yang Kami Kumpulkan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          'Kami mengumpulkan informasi pribadi dari pengguna ketika mereka mendaftar dan menggunakan aplikasi. Informasi yang Kami kumpulkan meliputi nama, alamat email, nomor telepon, dan alamat rumah pengguna. Kami juga dapat mengumpulkan informasi tentang jenis sampah yang dikumpulkan oleh pengguna dan riwayat transaksi yang terjadi di dalam aplikasi.',
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Penggunaan Informasi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          'Kami menggunakan informasi pribadi pengguna untuk mengoperasikan aplikasi, memberikan layanan pengambilan sampah, dan menjalankan program-program yang terkait dengan aplikasi. Kami juga dapat menggunakan informasi tersebut untuk mengirimkan pengumuman-pengumuman penting mengenai layanan dan fitur baru di dalam aplikasi. Informasi yang dikumpulkan juga dapat digunakan untuk analisis dan peningkatan layanan aplikasi.',
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Pembagian Informasi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          'Kami tidak akan menjual atau menyewakan informasi pribadi pengguna kepada pihak ketiga. Namun, Kami dapat membagikan informasi dengan mitra bisnis atau penyedia layanan yang terkait dengan operasi aplikasi. Kami juga dapat membagikan informasi ketika diperlukan untuk mematuhi hukum atau ketika diperlukan untuk melindungi hak atau properti Kami.',
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Keamanan Informasi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          'Kami mengambil tindakan yang wajar untuk melindungi informasi pribadi pengguna dari penggunaan yang tidak sah atau tidak diizinkan. Kami menggunakan metode-metode yang wajar untuk memastikan bahwa informasi yang dikumpulkan disimpan dengan aman dan dilindungi dari akses yang tidak sah.',
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Perubahan pada Kebijakan Privasi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          'Kami dapat mengubah Kebijakan Privasi ini dari waktu ke waktu. Jika Kami membuat perubahan yang signifikan pada Kebijakan Privasi ini, Kami akan memberitahukan pengguna dengan cara yang sesuai, misalnya dengan mengirimkan email atau mengirimkan pemberitahuan di dalam aplikasi.',
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Kontak',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          'Jika pengguna memiliki pertanyaan atau masalah mengenai Kebijakan Privasi ini, pengguna dapat menghubungi Kami melalui alamat email yang tercantum di dalam aplikasi.',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
