import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/expansible_list.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PasienTemplate extends StatefulWidget {
  PasienTemplate({super.key, required this.pasienTemplateItems, required this.qrData});
  
  final List<ExpansibleItem> pasienTemplateItems;
  final String qrData;

  @override
  State<PasienTemplate> createState() => _PasienTemplateState();
}

class _PasienTemplateState extends State<PasienTemplate> {
  late String _qrData;
  late List<ExpansibleItem> _pasienTemplateItems;

  @override
  void initState() {
    super.initState();
    _pasienTemplateItems = widget.pasienTemplateItems;
    _qrData = widget.qrData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Diagnosa', style: getDefaultTextStyle(font_size: 18.0)),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InformasiKunjungan(qrData: _qrData),
            ExpansibleList(items: _pasienTemplateItems),
          ],
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
          Text('9 Febuarari 2024 20:00'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dr. Patrick Wong'),
                  Text('Dokter Spesialis Penyakit Dalam'),
                  Text('Lantai 4, Ruang E - 405'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  QrImageView(
                    data: qrData,
                    version: QrVersions.auto,
                    size: 40.0,
                    gapless: false,
                    padding: EdgeInsets.all(0),
                  ),
                  Text('R001'),
                ],
              )
            ],
          ),
          Text('Nama Pasien'),
          Text('Umur Pasien'),
          Text('Jenis Kelamin Pasien'),
        ],
      ),
    );
  }
}