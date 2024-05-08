import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/expansible_list.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PasienTemplate extends StatefulWidget {
  PasienTemplate(
      {super.key,
      required this.title,
      required this.pasienTemplateItems,
      required this.qrData});

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

  @override
  void initState() {
    super.initState();
    title = widget.title;
    _pasienTemplateItems = widget.pasienTemplateItems;
    _qrData = widget.qrData;
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
              InformasiKunjungan(qrData: _qrData),
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
}

class InformasiKunjungan extends StatelessWidget {
  final String qrData;
  final double standardFontSize = 12.0;

  const InformasiKunjungan({
    super.key,
    required this.qrData,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
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
                  buildTextIcon(context, "9 Februari 2020", Icons.calendar_month),
                  buildTextIcon(context, "20:00", Icons.schedule),
                  buildTextIcon(context, "Lantai 4, Ruang E - 405", Icons.location_on),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Tiket', style: getDefaultTextStyle(font_size: standardFontSize, font_weight: FontWeight.bold),),
                  QrImageView(
                    data: qrData,
                    version: QrVersions.auto,
                    size: MediaQuery.of(context).size.width / 10,
                    gapless: false,
                    padding: EdgeInsets.all(0),
                  ),
                  Text('R001', style: getDefaultTextStyle(font_size: 14)),
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
                  buildSizedText(context, 'Dr. Patrick Wong', FontWeight.normal,TextAlign.start),
                  buildSizedText(context, 'Spesialis Penyakit Dalam', FontWeight.normal,TextAlign.start),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildSizedText(context, 'Pasien', FontWeight.bold, TextAlign.end),
                  buildSizedText(context, 'Franklin I. Turnip', FontWeight.normal,TextAlign.end),
                  buildSizedText(context, '7 Tahun 5 Bulan', FontWeight.normal,TextAlign.end),
                  buildSizedText(context, 'Pria', FontWeight.normal,TextAlign.end),
                ],
              )
            ],
          )
        ],
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
