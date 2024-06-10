import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes/Controller/detail_kunjungan_controller.dart'; 
import 'package:tubes/Model/janji_temu.dart';
import 'package:tubes/Model/kunjungan.dart';
import 'package:tubes/Pages/qrcode_buatjanji.dart';
import 'package:tubes/Widget/pressable_widget.dart';
import 'package:tubes/theme.dart';
import 'package:intl/intl.dart';
import 'package:tubes/Pages/Pasien/hasil_diagnosa.dart';
import 'package:tubes/Pages/Pasien/penunjang_medis.dart';
import 'package:tubes/Pages/Pasien/pembayaran.dart';

class DetailKunjungan extends StatefulWidget {
  final JanjiTemu janjiTemu;
  DetailKunjungan({required this.janjiTemu, Key? key}) : super(key: key);

  @override
  State<DetailKunjungan> createState() => _DetailKunjunganState();
}

class _DetailKunjunganState extends State<DetailKunjungan> {
  double iconSize = 14.0;
  List<Kunjungan> listKunjungan = [];
  bool _isfetchDetailKunjungan = true;

  @override
  void initState() {
    super.initState();
    fetchDetailKunjungan();
  }

  void fetchDetailKunjungan() async {
    setState(() {
      _isfetchDetailKunjungan = true;
    });
    await Provider.of<KunjunganProvider>(context, listen: false)
        .getDetailKunjungan(widget.janjiTemu.id);
    setState(() {
      final lokasiProvider =
          Provider.of<KunjunganProvider>(context, listen: false);
      listKunjungan = lokasiProvider.daftarKunjungan;
      _isfetchDetailKunjungan = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Detail Kunjungan", style: getDefaultTextStyle(font_size: 18.0)),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              fetchDetailKunjungan();
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(Icons.qr_code),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QRCodePage(
                              dokter: widget.janjiTemu.dokter,
                              tanggal: widget.janjiTemu.waktu,
                              jam: widget.janjiTemu.waktu,
                              qr_code: widget.janjiTemu.qr_code,
                              notiket: widget.janjiTemu.nomor_tiket,
                            )));
              },
            ),
          ),
        ],
      ),
      body: _isfetchDetailKunjungan
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: ListView.builder(
                itemCount: listKunjungan.length,
                itemBuilder: (BuildContext context, int index) {
                  final kunjungan = listKunjungan[index];
                  return Container(
                    child: PressableWidget(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return menu_janji(context, index);
                          },
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildIconText(Icons.medical_services,
                                      widget.janjiTemu.dokter.nama_dokter),
                                  buildIconText(
                                      Icons.schedule,
                                      DateFormat('dd MMMM yyyy').format(kunjungan.tanggal)),
                                  buildIconText(Icons.book, kunjungan.agenda),
                                ],
                              ),
                              buildTextButton("Pemeriksaan", statusGreen)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )),
    );
  }

  Column buildTextButton(String text, Color buttonColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 3.0, right: 5.0),
          child: Text(
            text,
            style:
                getDefaultTextStyle(font_size: 8, font_weight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Text("Lihat Detail", style: getDefaultTextStyle(font_size: 9.0)),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Icon(Icons.arrow_forward, size: iconSize),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
        )
      ],
    );
  }

  Row buildIconText(IconData iconData, String text) {
    return Row(
      children: [
        Icon(iconData, size: iconSize),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, bottom: 3.0),
          child: Text(text, style: getDefaultTextStyle(font_size: 11.0)),
        ),
      ],
    );
  }

  Container menu_janji(BuildContext context, int index) {
    if (listKunjungan[index].status == "menunggu_panggilan" ||
        listKunjungan[index].status == "masuk_ruangan" ||
        listKunjungan[index].status == "belum_bayar" ||
        listKunjungan[index].status == "selesai") {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HasilDiagnosa(
                            janji_temu: widget.janjiTemu,
                            kunjungan: listKunjungan[index])),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.biotech),
                title: Text('Penunjang Medis', style: getDefaultTextStyle()),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PenunjangMedis(context,
                            janji_temu: widget.janjiTemu,
                            kunjungan: listKunjungan[index])),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text('Pembayaran', style: getDefaultTextStyle()),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Pembayaran(
                            janji_temu: widget.janjiTemu,
                            kunjungan: listKunjungan[index])),
                  );
                },
              ),
            ],
          ),
        ),
      );
    } else if (listKunjungan[index].status == "sudah_waktunya") {
      return Container(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Silahkan konfirmasi kehadiran terlebih dahulu!"),
      ));
    } else if (listKunjungan[index].status == 'akan_datang') {
      return Container(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
            "Belum waktunya, anda hanya bisa membuka detail ketika sudah konfirmasi kehadiran pada saat waktunya tiba"),
      ));
    } else {
      return Container(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
            "Silahkan selesaikan proses kunjungan sebelumnya hingga pembayaran selesai"),
      ));
    }
  }
}
