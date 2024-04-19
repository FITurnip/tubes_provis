import 'package:flutter/material.dart';
import 'package:tubes/Model/dokter.dart';
import 'package:tubes/Model/janji_temu.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tubes/Widget/pressable_widget.dart';
import 'package:tubes/Pages/detail_kunjungan.dart';
import 'package:tubes/Widget/janji_card.dart';

class ListJanji extends StatefulWidget {
  ListJanji({super.key});

  
  @override
  State<ListJanji> createState() => _ListJanjiState();
}

class _ListJanjiState extends State<ListJanji> {
  List<JanjiTemu> daftarJanjiTemu = [];
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
    daftarJanjiTemu.add(JanjiTemu(
        ["#mual", "#pusing"],
        DateTime.parse('2024-01-21 15:00:00'),
        Dokter("dr. Hendra"),
        StatusJanjiTemu.akan_datang));
    daftarJanjiTemu.add(JanjiTemu(
        ["#nyeri_lambung", "#pusing"],
        DateTime.parse('2024-02-01 08:15:00'),
        Dokter("dr. Wijaya"),
        StatusJanjiTemu.selesai));
    daftarJanjiTemu.add(JanjiTemu(
        ["#nyeri_sendi"],
        DateTime.parse('2024-03-02 11:00:00'),
        Dokter("dr. Ridwan"),
        StatusJanjiTemu.rawat_jalan));
    daftarJanjiTemu.add(JanjiTemu(
        ["#vertigo", "#demam"],
        DateTime.parse('2024-01-08 09:45:00'),
        Dokter("dr. Richard"),
        StatusJanjiTemu.sudah_waktunya));
    daftarJanjiTemu.add(JanjiTemu(
        ["#mual", "#pusing"],
        DateTime.parse('2024-01-21 15:00:00'),
        Dokter("dr. Hendra"),
        StatusJanjiTemu.akan_datang));
    daftarJanjiTemu.add(JanjiTemu(
        ["#nyeri_lambung", "#pusing"],
        DateTime.parse('2024-02-01 08:15:00'),
        Dokter("dr. Wijaya"),
        StatusJanjiTemu.selesai));
    daftarJanjiTemu.add(JanjiTemu(
        ["#nyeri_sendi"],
        DateTime.parse('2024-03-02 11:00:00'),
        Dokter("dr. Ridwan"),
        StatusJanjiTemu.rawat_jalan));
    daftarJanjiTemu.add(JanjiTemu(
        ["#vertigo", "#demam"],
        DateTime.parse('2024-01-08 09:45:00'),
        Dokter("dr. Richard"),
        StatusJanjiTemu.sudah_waktunya));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: daftarJanjiTemu.length,
        itemBuilder: (BuildContext context, int index) {
          JanjiTemu item = daftarJanjiTemu[index];
          return Container(
            child: PressableWidget(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailKunjungan()));
              },
              child: JanjiCard(item: item),
            ),
          );
        });
  }
}