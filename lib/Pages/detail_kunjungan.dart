import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tubes/Model/dokter.dart';
import 'package:tubes/Widget/janji_card.dart';
import 'package:tubes/Widget/pressable_widget.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Model/janji_temu.dart';

import 'package:tubes/Pages/Pasien/hasil_diagnosa.dart';
import 'package:tubes/Pages/Pasien/resep_obat.dart';
import 'package:tubes/Pages/Pasien/penunjang_medis.dart';
import 'package:tubes/Pages/Pasien/pembayaran.dart';

class DetailKunjungan extends StatefulWidget {
  DetailKunjungan();

  @override
  State<DetailKunjungan> createState() => _DetailKunjunganState();
}

class _DetailKunjunganState extends State<DetailKunjungan> {
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
        title: Text("Detail Kunjungan", style: getDefaultTextStyle(font_size: 18.0)),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          child: ListJanji(),
        )
      ),
    );
  }
}

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
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return menu_janji(context);
                  },
                );
              },
              child: JanjiCard(item: item),
            ),
          );
        });
  }

  Container menu_janji(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.medical_information),
              title: Text('Hasil Diagnosa', style: getDefaultTextStyle()),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => HasilDiagnosa()));
              },
            ),
            ListTile(
              leading: Icon(Icons.receipt),
              title: Text('Resep Obat', style: getDefaultTextStyle()),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResepObat()));
              },
            ),
            ListTile(
              leading: Icon(Icons.biotech),
              title: Text('Penunjang Medis', style: getDefaultTextStyle()),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => PenunjangMedis()));
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Pembayaran', style: getDefaultTextStyle()),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Pembayaran()));
              },
            ),
          ],
        ),
      ),
    );
  }
}