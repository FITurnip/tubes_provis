import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tubes/Model/janji_temu.dart';
import 'package:tubes/theme.dart';

class JanjiCard extends StatelessWidget {
  const JanjiCard({
    super.key,
    required this.item,
  });

  final JanjiTemu item;

  @override
  Widget build(BuildContext context) {
    return Card(
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
            )));
  }
}