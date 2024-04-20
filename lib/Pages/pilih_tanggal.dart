import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/calendar.dart';

class PilihTanggal extends StatefulWidget {
  int pasien_id;
  bool useBPJS;
  String gejala;
  PilihTanggal(
      {super.key,
      required this.pasien_id,
      required this.useBPJS,
      required this.gejala});

  @override
  State<PilihTanggal> createState() => _PilihTanggalState();
}

class _PilihTanggalState extends State<PilihTanggal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pilih Waktu Janji Temu",
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
      body: Center(
        child: CalendarApp(
          pasien_id: widget.pasien_id,
          useBPJS: widget.useBPJS,
          gejala: widget.gejala,
        ),
      ),
    );
  }
}
