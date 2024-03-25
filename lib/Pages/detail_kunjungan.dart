import 'package:flutter/material.dart';

import 'package:tubes/Model/dokter.dart';
import 'package:tubes/Model/janji_temu.dart';
import 'package:tubes/Widget/custom_app_bar.dart';
import 'package:tubes/theme.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DetailKunjungan extends StatelessWidget {
  const DetailKunjungan({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Kunjungan'),
      ),
      body: Container(
        child: listJanji()
      ),
    );
  }
}


class listJanji extends StatefulWidget {
  const listJanji({super.key});

  @override
  State<listJanji> createState() => _listJanjiState();
}

class _listJanjiState extends State<listJanji> {
  List<JanjiTemu> daftarJanjiTemu = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    daftarJanjiTemu.add(JanjiTemu(
        ["#mual", "#pusing"],
        DateTime.parse('2024-01-21 15:00:00'),
        Dokter("Dr Hendra"),
        StatusJanjiTemu.akan_datang));
    daftarJanjiTemu.add(JanjiTemu(
        ["#nyeri_lambung", "#pusing"],
        DateTime.parse('2024-02-01 08:15:00'),
        Dokter("Dr Wijaya"),
        StatusJanjiTemu.selesai));
    daftarJanjiTemu.add(JanjiTemu(
        ["#nyeri_sendi"],
        DateTime.parse('2024-03-02 11:00:00'),
        Dokter("Dr Ridwan"),
        StatusJanjiTemu.rawat_jalan));
    daftarJanjiTemu.add(JanjiTemu(
        ["#vertigo", "#demam"],
        DateTime.parse('2024-01-08 09:45:00'),
        Dokter("Dr Richard"),
        StatusJanjiTemu.sudah_waktunya));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: daftarJanjiTemu.length,
        itemBuilder: (BuildContext context, int index) {
          JanjiTemu item = daftarJanjiTemu[index];
          return Container(
            child: Card(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Keluhan",
                                    style: getDefaultTextStyle(
                                        font_size: 10,
                                        font_weight: FontWeight.bold)),
                                Text(
                                  item.tag_keluhan.join(" "),
                                  style: getDefaultTextStyle(font_size: 12),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Janji Temu",
                                  style: getDefaultTextStyle(
                                      font_size: 10,
                                      font_weight: FontWeight.bold),
                                ),
                                Text(DateFormat("d MMMM y", "id_ID")
                                    .format(item.waktu))
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
                                  font_size: 14, font_weight: FontWeight.bold),
                            ),
                            Container(
                              color: statusGreen,
                              padding: EdgeInsets.all(8),
                              child: Text(item.getStatus()),
                            )
                          ],
                        )
                      ],
                    ))),
          );
        });
  }
}
