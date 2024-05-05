import 'package:flutter/material.dart';
import 'package:tubes/Widget/pressable_widget.dart';
import 'package:tubes/theme.dart';
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
  double iconSize = 14.0;

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
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  makeIconText(Icons.schedule, "9 Februari 2024"),
                                  makeIconText(Icons.assignment_ind, "9 Februari 2024"),
                                  makeIconText(Icons.book, "Kunjungan Rutin"),
                                ],
                              ),
                              makeTextButton("Pemeriksaan", statusGreen)
                            ],
                          )
                        )
                      ),
                  ),
                );
              }),
          )),
    );
  }

  Column makeTextButton(String text, Color buttonColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 3.0, right: 5.0),
          child: Text(
            text,
            style: getDefaultTextStyle(
              font_size: 10,
              font_weight: FontWeight.bold
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Text("Lihat Detail", style: getDefaultTextStyle(font_size: 10.0)),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Icon(Icons.arrow_forward, size: iconSize),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10)
          ),
        )
      ],
    );
  }

  Row makeIconText(IconData iconData, String text) {
    return Row(
      children: [
        Icon(iconData, size: iconSize),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, bottom: 3.0),
          child: Text(text, style: getDefaultTextStyle(),),
        ),
      ],
    );
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