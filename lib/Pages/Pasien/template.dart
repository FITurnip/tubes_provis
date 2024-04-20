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
  const InformasiKunjungan({
    super.key,
    required this.qrData,
  });

  final String qrData;

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
                  Text(
                    'Kunjungan',
                    style: getDefaultTextStyle(
                        font_size: 10, font_weight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  setTextIcon("9 Februari 2020", Icon(Icons.calendar_month)),
                  setTextIcon("20:00", Icon(Icons.schedule)),
                  setTextIcon(
                      "Lantai 4, Ruang E - 405", Icon(Icons.location_on)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  QrImageView(
                    data: qrData,
                    version: QrVersions.auto,
                    size: 60.0,
                    gapless: false,
                    padding: EdgeInsets.all(0),
                  ),
                  Text('R001', style: getDefaultTextStyle(font_size: 16)),
                ],
              )
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            'Dokter',
            style: getDefaultTextStyle(
                font_size: 10, font_weight: FontWeight.bold),
          ),
          SizedBox(height: 5.0),
          setTextIcon('Dr. Patrick Wong', Icon(Icons.assignment_ind)),
          setTextIcon(
              'Dokter Spesialis Penyakit Dalam', Icon(Icons.medical_services)),
          SizedBox(height: 10.0),
          Text(
            'Pasien',
            style: getDefaultTextStyle(
                font_size: 10, font_weight: FontWeight.bold),
          ),
          SizedBox(height: 5.0),
          setTextIcon('Franklin I. Turnip', Icon(Icons.person)),
          setTextIcon('7 Tahun 5 Bulan', Icon(Icons.date_range)),
          setTextIcon('Pria', Icon(Icons.male)),
        ],
      ),
    );
  }

  Row setTextIcon(String text, Icon icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          width: 10.0,
        ),
        Text(text, style: getDefaultTextStyle()),
      ],
    );
  }
}
