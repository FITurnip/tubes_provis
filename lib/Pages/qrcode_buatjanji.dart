import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tubes/Controller/janji_temu_controller.dart';
import 'package:tubes/Model/dokter.dart';
import 'package:tubes/Services/network.dart';
import 'package:tubes/Widget/bottom_nav.dart';
import 'package:tubes/theme.dart';

class QRCodePage extends StatelessWidget {
  final Dokter dokter;
  final DateTime tanggal; // Tambahkan variabel qrData
  final DateTime jam;

  const QRCodePage({
    Key? key,
    required this.dokter,
    required this.tanggal,
    required this.jam, // Tambahkan parameter qrData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double qrSize = MediaQuery.of(context).size.width * 0.4;

    return Scaffold(
      body: Container(
        alignment: Alignment
            .bottomCenter, // Aligns the container content to the bottom center
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  Text('KODE QR',
                      style: getDefaultTextStyle(font_size: 30)), // Spasi atas
                  Consumer<JanjiTemuControlProvider>(
                      builder: (context, value, _) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(Network()
                            .accessFile(value.current_created!.qr_code)),
                        Text(value.current_created!.nomor_tiket,
                            style: getDefaultTextStyle(font_size: 40)),
                      ],
                    );
                  }),
                ],
              ),
            ),
            Positioned(
              top: 20,
              right: 10,
              child: IconButton(
                icon: Icon(Icons.close_rounded),
                iconSize: 50,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => BottomNav(
                                selectedIndex: 0,
                              )));
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 300, // Adjust height as needed
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Warna bayangan
                      spreadRadius: 5, // Radius penyebaran bayangan
                      blurRadius: 7, // Radius blur bayangan
                      offset: Offset(0, 3), // Offset bayangan
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        dokter.nama_dokter,
                        style: getDefaultTextStyle(
                            font_size: 20, font_weight: FontWeight.w800),
                      ),
                      Text(
                        dokter.bidang,
                        style: getDefaultTextStyle(font_size: 15),
                      ),
                      SizedBox(height: 20),
                      Text(
                        DateFormat("d MMMM y", "id_ID").format(tanggal),
                        style: getDefaultTextStyle(font_size: 17),
                      ),
                      Text(
                        DateFormat("HH:mm", "id_ID").format(jam),
                        style: getDefaultTextStyle(font_size: 17),
                      ),
                      Text(
                        "Lokasi : " +
                            dokter.jadwal!.ruangan.detail +
                            ", " +
                            dokter.jadwal!.ruangan.nama_ruang,
                        style: getDefaultTextStyle(font_size: 17),
                      ),
                      Spacer(), // Spacer to push the button to the bottom
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: statusRed,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Center(
                                child: Text(
                                  'Batalkan',
                                  style: getDefaultTextStyle(
                                    font_color: Colors.white,
                                    font_size: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
