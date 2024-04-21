import 'package:flutter/material.dart';
import 'package:tubes/Pages/qrcode_buatjanji.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/calendar.dart';

class DetailDokter extends StatelessWidget {
  final String name;
  final String specialty;
  final String image;

  const DetailDokter({
    Key? key,
    required this.name,
    required this.specialty,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dokter",
          style: getDefaultTextStyle(font_size: 20, font_color: blackColor),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
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
                      name,
                      style: getDefaultTextStyle(font_size: 20, font_weight: FontWeight.w800),
                    ),
                    Text(
                      specialty,
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
                    Container(
                      margin: EdgeInsets.only(bottom: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QRCodePage(
                                doctorName: name,
                                doctorSpecialty: specialty,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: defBlue,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Center(
                            child: Text(
                              'Selanjutnya',
                              style: getDefaultTextStyle(
                                font_color: Colors.white,
                                font_size: 18,
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
    );
  }
}
