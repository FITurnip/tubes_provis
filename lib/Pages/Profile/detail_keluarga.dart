import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tubes/Model/pasien.dart';
import 'package:tubes/Services/network.dart';
import 'package:tubes/theme.dart';

class DetailKeluarga extends StatelessWidget {
  final Pasien pasien;

  DetailKeluarga({required this.pasien});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Keluarga Terdaftar",
            style: getDefaultTextStyle(font_size: 18.0)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: normalWhite, // White background for the container
              border: Border.all(color: defBlue, width: 2),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset:
                      Offset(0, 3), // Offset for shadow outside the container
                ),
              ],
            ),
            padding: const EdgeInsets.all(35.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(
                            0, 3), // Offset for shadow outside the circle
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: (pasien.foto != null &&
                            pasien.foto!.isNotEmpty &&
                            pasien.foto != 'null')
                        ? NetworkImage(Network().getUrlFile(pasien.foto))
                        : AssetImage('assets/img/photo_profile.png')
                            as ImageProvider,
                  ),
                ),
                SizedBox(height: 16),
                Text(pasien.name,
                    textAlign: TextAlign.start,
                    style: getDefaultTextStyle(
                        font_size: 18, font_weight: FontWeight.w600)),
                Divider(
                  color: blackColor,
                  height: 30,
                ),
                Text(
                  pasien.nik,
                  style: getDefaultTextStyle(
                      font_size: 16, font_weight: FontWeight.w500),
                ),
                Divider(
                  color: blackColor,
                  height: 30,
                ),
                Text(
                  pasien.jenkel,
                  style: getDefaultTextStyle(
                      font_size: 16, font_weight: FontWeight.w500),
                ),
                Divider(
                  color: blackColor,
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      pasien.id_tempat_lahir.toString(),
                      style: getDefaultTextStyle(
                          font_size: 16, font_weight: FontWeight.w500),
                    ), //ini yang tempat lahir kan berupa angka yang terhubung ke id kota ceuk mne kudu nga get id provinsi heula karek ka kota eta kumaha? biar jadi tempat lahir
                    Text(
                      ',${DateFormat('dd MMMM yyyy').format(pasien.tgl_lahir)}',
                      style: getDefaultTextStyle(
                          font_size: 16, font_weight: FontWeight.w500),
                    ),
                  ],
                ),
                Divider(
                  color: blackColor,
                  height: 30,
                ),
                Text(
                  pasien.no_telp,
                  style: getDefaultTextStyle(
                      font_size: 16, font_weight: FontWeight.w500),
                ),
                Divider(
                  color: blackColor,
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
