import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/pressable_widget.dart';
import 'package:tubes/Pages/detail_kunjungan.dart';
import 'package:intl/intl.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          padding: EdgeInsets.all(25.0),
          child: Text('Riwayat Anda', style: getDefaultTextStyle(font_size: 20)),
        ),
      )),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
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
                                  Text(DateFormat("d MMMM y", "id_ID").format(DateTime.now()), style: getDefaultTextStyle())
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
                                "Nama Dokter",
                                style: getDefaultTextStyle(
                                    font_size: 14,
                                    font_weight: FontWeight.bold),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Text("Akan Datang", style: getDefaultTextStyle()),
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
          }
        )
      ),
    );
  }
}
