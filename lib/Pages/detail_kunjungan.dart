import 'package:flutter/material.dart';

import 'package:tubes/Widget/custom_app_bar.dart';
import 'package:tubes/theme.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tubes/Widget/rounded_image.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailKunjungan extends StatelessWidget {
  List<String> menu = []; //data untuk listview

  DetailKunjungan({super.key}) {
    menu.add("Hasil Diagnosa");
    menu.add("Resep Obat");
    menu.add("Surat Pengantar Penunjang Medis");
    menu.add("Jadwal Kontrol");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Kunjungan', style: getDefaultTextStyle(font_size: 20.0)),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: RoundedImage(
                    imagePath: 'assets/img/photo_profile.png', // Replace with your image path
                    size: 60.0, // Adjust as needed
                  ),
                ),
                Column( // ini masih belum ke kiri
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // masukkan semua informasi janji temu
                    Text("dr. Hendra", style: getDefaultTextStyle(font_size: 18.0), textAlign: TextAlign.left),
                    Text("Poli Umum", style: getDefaultTextStyle(), textAlign: TextAlign.left),
                    Text("#Sakit Kepala", style: getDefaultTextStyle(), textAlign: TextAlign.left),
                  ]
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                ),
                QrImageView(
                  data: 'This is a simple QR code',
                  version: QrVersions.auto,
                  size: 60.0,
                  gapless: false,
                ),
              ]
            ),
            SizedBox(height: 25.0),
            Expanded(
              child: ListView.builder(
                itemCount: menu.length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                        border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.grey), // Bottom border
                      )
                    ),
                    child: ListTile(
                      title: Text(menu[index], style: getDefaultTextStyle()),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        // Handle tap
                      },
                    ),
                  );
                },
              ),
            ),
          ]
        )
      ),
    );
  }
}
