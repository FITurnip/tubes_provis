import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/calendar.dart';

class QRCodePage extends StatelessWidget {
  final String doctorName;
  final String doctorSpecialty;// Tambahkan variabel qrData

  const QRCodePage({
    Key? key,
    required this.doctorName,
    required this.doctorSpecialty, // Tambahkan parameter qrData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  double qrSize = MediaQuery.of(context).size.width * 0.8;

  return Scaffold(
    body: Container(
      alignment: Alignment.bottomCenter, // Aligns the container content to the bottom center
      child: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Text('KODE QR', style: getDefaultTextStyle(font_size: 30)),// Spasi atas
                QrImageView(
                  data: doctorName + "\n" + doctorSpecialty,
                  version: QrVersions.auto,
                  size: qrSize,
                  gapless: false,
                  padding: EdgeInsets.all(20),
                ),
                Text('R001', style: getDefaultTextStyle(font_size: 40)),
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
                Navigator.pop(context); // Ganti dengan navigasi ke halaman form keluhan
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
                      doctorName,
                      style: getDefaultTextStyle(font_size: 20, font_weight: FontWeight.w800),
                    ),
                    Text(
                      doctorSpecialty,
                      style: getDefaultTextStyle(font_size: 15),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "22 Februari 2024",
                      style: getDefaultTextStyle(font_size: 17),
                    ),
                    Text(
                      "01.00 - 05.00",
                      style: getDefaultTextStyle(font_size: 17),
                    ),
                    Text(
                      "Lokasi : Lantai 4, Ruang E - 405 ",
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
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
