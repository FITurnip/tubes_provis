import 'package:flutter/material.dart';
import 'package:tubes/Model/dokter.dart';
import 'package:tubes/Model/janji_temu.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tubes/Widget/pressable_widget.dart';
import 'package:tubes/Pages/Kunjungan/detail_kunjungan.dart';
import 'package:intl/intl.dart';
import 'package:tubes/theme.dart';

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailKunjungan()));
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
                                        font_weight: FontWeight.bold),
                                  ),
                                  Text("Legi Kuswandi",
                                      style: getDefaultTextStyle()),
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
                                  Text(
                                      DateFormat("d MMMM y", "id_ID")
                                          .format(item.waktu),
                                      style: getDefaultTextStyle())
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
                              buildButton(item.getStatus(),
                                  getStatusColor(item.getStatus()))
                            ],
                          )
                        ],
                      ))),
            ),
          );
        });
  }

  Container buildButton(String text, Color buttonColor) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(text,
          style:
              getDefaultTextStyle(font_size: 9, font_weight: FontWeight.bold)),
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(10)),
    );
  }

  Color getStatusColor(String status) {
    final Color color;
    switch (status) {
      case "Rawat Jalan":
        color = defBlue;
        break;
      case "Akan Datang":
        color = statusGreen;
        break;
      case "Sudah Waktunya":
        color = statusRed;
        break;
      case "Menunggu Panggilan":
        color = basicYellow;
        break;
      case "Selesai":
        color = defBlue;
        break;
      default:
        color = Colors.transparent; // Default color if status is not recognized
        break;
    }
    return color;
  }
}
