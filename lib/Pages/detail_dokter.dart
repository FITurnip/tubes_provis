import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tubes/Model/dokter.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/calendar.dart';

class DetailDokter extends StatelessWidget {
  final Dokter dokter;
  final DateTime tanggal;

  const DetailDokter({
    Key? key,
    required this.dokter,
    required this.tanggal,
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
              child: Image(
            image: NetworkImage(dokter.foto),
            fit: BoxFit.cover,
          )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      dokter.nama,
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
                      DateFormat("HH:mm").format(DateFormat("HH:mm:ss")
                              .parse(dokter.jadwal!.jam_mulai)) +
                          " s.d " +
                          DateFormat("HH:mm").format(DateFormat("HH:mm:ss")
                              .parse(dokter.jadwal!.jam_berakhir)),
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
                    Container(
                      margin: EdgeInsets.only(bottom: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          print([
                            dokter.jenkel,
                            dokter.tglLahir,
                            dokter.jadwal!.jam_mulai
                          ]);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF54d4da),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Center(
                            child: Text(
                              'Buat Janji Temu',
                              style: getDefaultTextStyle(
                                font_color: Colors.white,
                                font_size: 14,
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
