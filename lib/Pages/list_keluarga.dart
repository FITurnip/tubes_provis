import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tubes/Model/dokter.dart';
import 'package:tubes/Pages/form_tambah_keluarga.dart';
import 'package:tubes/Widget/janji_card.dart';
import 'package:tubes/Widget/pressable_widget.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Model/janji_temu.dart';

import 'package:tubes/Pages/Pasien/hasil_diagnosa.dart';
import 'package:tubes/Pages/Pasien/resep_obat.dart';
import 'package:tubes/Pages/Pasien/penunjang_medis.dart';
import 'package:tubes/Pages/Pasien/pembayaran.dart';

class DetailKeluarga extends StatefulWidget {
  DetailKeluarga();

  @override
  State<DetailKeluarga> createState() => _DetailKeluargaState();
}

class _DetailKeluargaState extends State<DetailKeluarga> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back when the button is pressed
            Navigator.of(context).pop();
          },
        ),
        title: Text("Keluarga Terdaftar",
            style: getDefaultTextStyle(font_size: 18.0)),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => tambahkeluargaPage(),
                  fullscreenDialog: true,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: defBlue,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  color: normalWhite,
                ),
                Text(
                  "Tambah Anggota Keluarga",
                  style: getDefaultTextStyle(font_color: normalWhite),
                )
              ],
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Container(
            // child:(),
            ),
      ),
    );
  }
}
