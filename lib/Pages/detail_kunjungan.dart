import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tubes/Model/dokter.dart';
import 'package:tubes/Widget/pressable_widget.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Model/janji_temu.dart';
import 'package:intl/intl.dart';

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
        title: Text("Detail Kunjungan",
            style: getDefaultTextStyle(font_size: 18.0)),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            child: ListJanji(),
          )),
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
        Dokter("Dr Fya Agustin", "Poli Umum", "assets/img/dokter/dokter1.jpg",
            "Perempuan", DateTime.parse("1990-11-02")),
        StatusJanjiTemu.akan_datang));
    daftarJanjiTemu.add(JanjiTemu(
        ["#nyeri_lambung", "#pusing"],
        DateTime.parse('2024-02-01 08:15:00'),
        Dokter("Dr Wijaya", "Poli Umum", "assets/img/dokter/dokter2.jpg",
            "Laki-laki", DateTime.parse("1990-11-02")),
        StatusJanjiTemu.selesai));
    daftarJanjiTemu.add(JanjiTemu(
        ["#nyeri_sendi"],
        DateTime.parse('2024-03-02 11:00:00'),
        Dokter("Dr Reni Ransyiah", "Poli Umum", "assets/img/dokter/dokter3.jpg",
            "Perempuan", DateTime.parse("1990-11-02")),
        StatusJanjiTemu.rawat_jalan));
    daftarJanjiTemu.add(JanjiTemu(
        ["#vertigo", "#demam"],
        DateTime.parse('2024-01-08 09:45:00'),
        Dokter("Dr Jayanti Putri", "Poli Umum", "assets/img/dokter/dokter4.jpg",
            "Perempuan", DateTime.parse("1990-11-02")),
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
              child: Card(
                child: Padding(
                    padding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'R001',
                                  style: getDefaultTextStyle(
                                    font_size: 10,
                                    font_weight: FontWeight.bold
                                  ),
                                ),
                                Text("Legi Kuswandi", style: getDefaultTextStyle()),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Janji Temu",
                                  style: getDefaultTextStyle(
                                    font_size: 10,
                                    font_weight: FontWeight.bold
                                  ),
                                ),
                                Text(DateFormat("d MMMM y", "id_ID")
                                    .format(item.waktu), style: getDefaultTextStyle())
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              item.dokter.nama,
                              style: getDefaultTextStyle(
                                  font_size: 14,
                                  font_weight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Text(item.getStatus(), style: getDefaultTextStyle()),
                              decoration: BoxDecoration(
                                color: statusGreen,
                                borderRadius: BorderRadius.circular(10)
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  )
                ),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HasilDiagnosa()));
              },
            ),
            ListTile(
              leading: Icon(Icons.receipt),
              title: Text('Resep Obat', style: getDefaultTextStyle()),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResepObat()));
              },
            ),
            ListTile(
              leading: Icon(Icons.biotech),
              title: Text('Penunjang Medis', style: getDefaultTextStyle()),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PenunjangMedis()));
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Pembayaran', style: getDefaultTextStyle()),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Pembayaran()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
