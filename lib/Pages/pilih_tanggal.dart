import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/calendar.dart';

class PilihTanggal extends StatefulWidget {
  const PilihTanggal({super.key});

  @override
  State<PilihTanggal> createState() => _PilihTanggalState();
}

class _PilihTanggalState extends State<PilihTanggal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buat Janji",
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
        child: CalendarApp(), // Ganti YourCalendarWidget dengan widget kalender yang ingin Anda gunakan
      ),
    );
  }
}

