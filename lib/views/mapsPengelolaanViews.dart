import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class MapsPengelolaanView extends StatefulWidget {
  const MapsPengelolaanView({super.key});

  @override
  State<MapsPengelolaanView> createState() => _MapsPengelolaanViewState();
}

class _MapsPengelolaanViewState extends State<MapsPengelolaanView> {
  GoogleMapController? mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<PengelolaanProv>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Pengelolaan"),
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Color(0xffff3bd77d),
        ),
        body: Column(
          children: [
            Expanded(
              child: GoogleMap(
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                    target: LatLng(prov.lati, prov.long), zoom: 17),
                markers: {
                  Marker(
                    markerId: MarkerId('marker_1'),
                    position: LatLng(prov.lati, prov.long),
                    icon: BitmapDescriptor.defaultMarker,
                  ),
                },
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            SizedBox(
              height: 250,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  left: 15,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    Text(
                      "Pengambilan Sampah",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    ListTile(
                      title: Text(
                        "${prov.tanggalPengambilan} , Pukul 09.00\nPetugas Sampah sedang menuju kelokasi anda.",
                        style: TextStyle(fontSize: 14),
                      ),
                      leading: Icon(
                        Icons.circle,
                        size: 35,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        "${prov.tanggalPengambilan} , Pukul 10.30\nHarap untuk mempersiapkan sampah & menunggu petugas sampah datang.",
                        style: TextStyle(fontSize: 14),
                      ),
                      leading: Icon(
                        Icons.circle,
                        size: 35,
                        color: Colors.yellow,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        "${prov.tanggalPengambilan} , Pukul 10.40\nLokasi TPA & jenis sampah yang dipilih sedang diperiksa Pihak TPA terkait",
                        style: TextStyle(fontSize: 14),
                      ),
                      leading: Icon(
                        Icons.circle,
                        size: 35,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
