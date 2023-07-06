import 'package:flutter/material.dart';
import 'EdukasiSampahSemen.dart';
import 'EdukasiBotolPlastik.dart';
import 'EdukasiEmber.dart';
import 'EdukasiLogam.dart';
import 'EdukasiBesi.dart';
import 'EdukasiKardus.dart';
import 'EdukasiKertas.dart';
import 'EdukasiBotolBeling.dart';

class WasteItem {
  final String title;
  final String deskripsi;
  final String imageUrl;

  WasteItem({
    required this.title,
    required this.deskripsi,
    required this.imageUrl,
  });
}

class EdukasiList extends StatefulWidget {
  const EdukasiList({Key? key}) : super(key: key);

  @override
  State<EdukasiList> createState() => _EdukasiListState();
}

class _EdukasiListState extends State<EdukasiList> {
  final List<WasteItem> wasteItems = [
    WasteItem(
      title: 'Sampah Semen',
      deskripsi: 'Sampah semen bekas konstruksi atau bangunan.',
      imageUrl:
          'https://cdn.discordapp.com/attachments/942624379735511100/1116647773111074816/index.jpg',
    ),
    WasteItem(
      title: 'Botol Plastik',
      deskripsi: 'Botol plastik bekas minuman kemasan.',
      imageUrl:
          'https://images-ext-1.discordapp.net/external/o-iAlEjqbTOLxHi-lhWz-SqEIn-Z5kT5v5K5zV5V09c/https/cdns.klimg.com/dream.co.id/resized/640x320/news/2022/01/19/189631/buang-sampah-botol-plastik-bisa-menghasilkan-uang-elektronik-220119h.jpg?width=960&height=480',
    ),
    WasteItem(
      title: 'Emberan/Plastik Warna',
      deskripsi: 'Ember plastik bekas perabotan rumah tangga.',
      imageUrl:
          'https://images-ext-1.discordapp.net/external/wGrAvkQgWylYmcjbNcG9tbV_Tjjt1hOdSKxBdLPy4qU/https/cdns.klimg.com/merdeka.com/i/w/news/2020/09/07/1217307/670x335/8-cara-mengurangi-limbah-rumah-tangga-jaga-lingkungan-rumah-anda.jpg?width=1005&height=502',
    ),
    WasteItem(
      title: 'Logam',
      deskripsi: 'Logam bekas limbah pabrik material logam.',
      imageUrl:
          'https://images-ext-1.discordapp.net/external/EXsHfChFUa9scuCK3Nz6TfnmQRJCIl7-YkDPpOpH5CY/%3Fs%3D1024x1024%26w%3Dis%26k%3D20%26c%3D4-hgi8lFtTqtTuDrPidPETGzUyTbGerLbcHQgSiNj7w%3D/https/media.istockphoto.com/id/1141244767/id/foto/limbah-baja-tumpukan-logam-sampah-stainless-steel-ditumpuk-bersama-sama-bersiap-untuk-mendaur.jpg?width=874&height=655',
    ),
    WasteItem(
      title: 'Besi',
      deskripsi: 'Sampah besi bekas limbah pabrik material besi.',
      imageUrl:
          'https://images-ext-1.discordapp.net/external/KMEZzCelAzACYURycg8HD5Id6qCzgUOk8M_4MIRXdtY/https/www.universaleco.id/uploads/blog/20220105092801blog.jpg?width=984&height=655',
    ),
    WasteItem(
      title: 'Sampah Kardus',
      deskripsi: 'Sampah kardus bekas limbah grosir.',
      imageUrl:
          'https://images-ext-2.discordapp.net/external/wki0A9o2JZS1edinLVy88G_DCKCysjv85cg26nzLvLE/https/ichef.bbci.co.uk/news/640/cpsprodpb/35D1/production/_113877731_board-1.jpg?width=960&height=540',
    ),
    WasteItem(
      title: 'Sampah Kertas',
      deskripsi: 'Sampah kardus bekas perpustakaan buku.',
      imageUrl:
          'https://images-ext-1.discordapp.net/external/kMSKRsJpo5FhQfvR7G3ptavM6HG7XKytaTS2OaCwwW8/https/kampoenghijau.com/wp-content/uploads/2023/02/sampah-kertas-limbah-kertas-hemat-kertas-mencegah-kerusakan-ekosistem-alam-bahan-baku-pembuatan-kertas-cara-buat-kertas.jpg?width=984&height=655',
    ),
    WasteItem(
      title: 'Botol Beling',
      deskripsi: 'Sampah botol beling bekas limbah restoran.',
      imageUrl:
          'https://images-ext-1.discordapp.net/external/PovLeFVfaklYz37Ki3PFKCH4WqzijdEVG9aSZxxhUnE/https/hanifweb.files.wordpress.com/2013/04/green-glass-bottles-008.jpg?width=690&height=414',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff3bd77d),
        title: Text('Edukasi'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          itemCount: wasteItems.length,
          itemBuilder: (context, index) {
            final wasteItem = wasteItems[index];
            return Column(
              children: [
                ListTile(
                  leading: Image.network(
                    wasteItem.imageUrl,
                    width: 40,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    wasteItem.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    if (wasteItem.title == 'Sampah Semen') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EdukasiSampahSemen(),
                        ),
                      );
                    } else if (wasteItem.title == 'Botol Plastik') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EdukasiBotolPlastik(),
                        ),
                      );
                    } else if (wasteItem.title == 'Emberan/Plastik Warna') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EdukasiEmber(),
                        ),
                      );
                    } else if (wasteItem.title == 'Logam') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EdukasiLogam(),
                        ),
                      );
                    } else if (wasteItem.title == 'Besi') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EdukasiBesi(),
                        ),
                      );
                    } else if (wasteItem.title == 'Sampah Kardus') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EdukasiKardus(),
                        ),
                      );
                    } else if (wasteItem.title == 'Sampah Kertas') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EdukasiKertas(),
                        ),
                      );
                    } else if (wasteItem.title == 'Botol Beling') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EdukasiBotolBeling(),
                        ),
                      );
                    }
                  },
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      wasteItem.deskripsi,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey,
              thickness: 1.0,
              indent: 16.0,
              endIndent: 16.0,
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EdukasiList(),
  ));
}
