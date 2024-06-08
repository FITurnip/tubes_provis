import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/expansible_list.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tubes/Model/janji_temu.dart';

class PasienTemplate extends StatefulWidget {
  final JanjiTemu janjiTemu;
  PasienTemplate(
      {super.key,
      required this.title,
      required this.pasienTemplateItems,
      required this.qrData,
      required this.janjiTemu});

  String title;
  List<ExpansibleItem> pasienTemplateItems;
  String qrData;

  @override
  State<PasienTemplate> createState() => _PasienTemplateState();
}

class _PasienTemplateState extends State<PasienTemplate> {
  late String title;
  late List<ExpansibleItem> _pasienTemplateItems;
  late String _qrData;
  final double standardFontSize = 12.0;

  int ?umurDalamTahun, umurDalamBulan;


  @override
  void initState() {
    super.initState();
    title = widget.title;
    _pasienTemplateItems = widget.pasienTemplateItems;
    _qrData = widget.qrData;

    print("data: ");
    print(widget.janjiTemu.waktu);

    umurDalamTahun = widget.janjiTemu.waktu.year - widget.janjiTemu.pasien.tgl_lahir.year;
    umurDalamBulan = (widget.janjiTemu.waktu.month - widget.janjiTemu.pasien.tgl_lahir.month) % 12;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: getDefaultTextStyle(font_size: 18.0)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildSizedText(context, 'Kunjungan', FontWeight.bold, TextAlign.start),
                            SizedBox(height: 5.0),
                            buildTextIcon(context, DateFormat('dd MMMM yyyy').format(widget.janjiTemu.waktu), Icons.calendar_month),
                            buildTextIcon(context, DateFormat('hh:mm').format(widget.janjiTemu.waktu), Icons.schedule),
                            buildTextIcon(context, "${widget.janjiTemu.dokter.jadwal!.ruangan.nama_ruang}, ${widget.janjiTemu.dokter.jadwal!.ruangan.detail}", Icons.location_on),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Tiket', style: getDefaultTextStyle(font_size: standardFontSize, font_weight: FontWeight.bold),),
                            QrImageView(
                              data: _qrData,
                              version: QrVersions.auto,
                              size: MediaQuery.of(context).size.width / 10,
                              gapless: false,
                              padding: EdgeInsets.all(0),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildSizedText(context, 'Dokter', FontWeight.bold, TextAlign.start),
                            buildSizedText(context, 'dr. ${widget.janjiTemu.dokter.nama_dokter}', FontWeight.normal,TextAlign.start),
                            buildSizedText(context, widget.janjiTemu.dokter.bidang, FontWeight.normal,TextAlign.start),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            buildSizedText(context, 'Pasien', FontWeight.bold, TextAlign.end),
                            buildSizedText(context, widget.janjiTemu.pasien.name, FontWeight.normal,TextAlign.end),
                            buildSizedText(context, '$umurDalamTahun Tahun $umurDalamBulan Bulan', FontWeight.normal,TextAlign.end),
                            buildSizedText(context, widget.janjiTemu.pasien.jenkel, FontWeight.normal,TextAlign.end),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ExpansibleList(items: _pasienTemplateItems),
            ],
          ),
        ),
      ),
    );
  }


  SizedBox buildSizedText(BuildContext context, String text, FontWeight fontWeight, TextAlign textAlign) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 25,
      child: Text(
        text,
        style: getDefaultTextStyle(font_size: standardFontSize, font_weight: fontWeight),
        textAlign: textAlign));
  }

  Row buildTextIcon(BuildContext context, text, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 11.0),
        SizedBox(
          width: 10.0,
        ),
        buildSizedText(context, text, FontWeight.normal, TextAlign.start),
      ],
    );
  }
}