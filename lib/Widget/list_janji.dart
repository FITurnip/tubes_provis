import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tubes/Controller/janji_temu_controller.dart';
import 'package:tubes/Model/janji_temu.dart';
import 'package:tubes/Pages/Kunjungan/detail_kunjungan.dart';
import 'package:tubes/Widget/pressable_widget.dart';
import 'package:tubes/theme.dart';

class ListJanji extends StatelessWidget {
  const ListJanji({Key? key});

  @override
  Widget build(BuildContext context) {
    final janjiTemuController = Provider.of<JanjiTemuControlProvider>(context);
    if (janjiTemuController.listJanjiTemu.isEmpty &&
        !janjiTemuController.isFetch) {
      janjiTemuController.fetchJanjiTemu();
    }
    List<JanjiTemu> daftarJanjiTemu = janjiTemuController.listJanjiTemu;
    return Consumer<JanjiTemuControlProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          itemCount: daftarJanjiTemu.length,
          itemBuilder: (BuildContext context, int index) {
            JanjiTemu item = daftarJanjiTemu[index];
            return Container(
              child: PressableWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailKunjungan(
                        janjiTemu: item,
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                                Text(item.nomor_tiket,
                                    style: getDefaultTextStyle()),
                                Text(item.pasien.name,
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
                                    font_weight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  DateFormat("d MMMM y", "id_ID")
                                      .format(item.waktu),
                                  style: getDefaultTextStyle(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              item.dokter.nama_dokter,
                              style: getDefaultTextStyle(
                                font_size: 14,
                                font_weight: FontWeight.bold,
                              ),
                            ),
                            buildButton(
                                item.getStatus(), item.getStatusColor()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Container buildButton(String text, Color buttonColor) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        style: getDefaultTextStyle(
          font_size: 9,
          font_weight: FontWeight.bold,
        ),
      ),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
