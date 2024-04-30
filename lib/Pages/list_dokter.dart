import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tubes/Model/jadwal_dokter.dart';
import 'package:tubes/Model/dokter.dart';
import 'package:tubes/Model/ruangan.dart';
import 'package:tubes/Services/network.dart';
import 'package:tubes/global_var.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Pages/detail_dokter.dart';

class ListDokter extends StatefulWidget {
  final Object dataJadwal;
  const ListDokter({super.key, required this.dataJadwal});
  // Object dataJadwal = {
  //   'rawTgl': DateTime.parse("2024-04-20 00:00:00"),
  //   'hari': "Sabtu",
  //   'waktu': "9:15",
  //   'pasien_id': 2,
  //   'useBPJS': false,
  //   'gejala': 'test'
  // };

  @override
  State<ListDokter> createState() => _ListDokterState();
}

class _ListDokterState extends State<ListDokter> {
  List<Dokter> listDokter = [];
  var _dataJadwal;
  @override
  void initState() {
    super.initState();
    _dataJadwal = widget.dataJadwal;
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _getListDokter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pilih Dokter",
          style: getDefaultTextStyle(font_size: 20, font_color: blackColor),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body:
          ListDokterContent(listDokter: listDokter, jadwal: widget.dataJadwal),
    );
  }

  _getListDokter() async {
    var data = {
      'hari': _dataJadwal['hari'].toString(),
      'jam': _dataJadwal['waktu'].toString()
    };
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return loadingDialog;
        });

    var res = await Network().getData(data, 'masterdata/list-dokter');
    if (res is String) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res),
        backgroundColor: statusRed,
      ));
    } else {
      var body = json.decode(res.body);
      if (body.containsKey('success')) {
        if (body['success']) {
          for (var dataDokter in body['data']) {
            var newDokter = new Dokter(
                dataDokter['nama_dokter'],
                dataDokter['bidang']['bidang'],
                dataDokter['foto'],
                dataDokter['jenkel'],
                DateTime.parse(dataDokter['tgl_lahir']));
            var newRuangan = new Ruangan(
                dataDokter['jadwal'][0]['ruangan']['id'],
                dataDokter['jadwal'][0]['ruangan']['nama_ruang'],
                dataDokter['jadwal'][0]['ruangan']['detail_ruang']);
            newDokter.jadwal = new JadwalDokter(
                dataDokter['jadwal'][0]['id'],
                dataDokter['jadwal'][0]['hari'],
                dataDokter['jadwal'][0]['jam_mulai'],
                dataDokter['jadwal'][0]['jam_berakhir'],
                newRuangan);
            listDokter.add(newDokter);
          }
          setState(() {
            listDokter = listDokter;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(body['message']),
            backgroundColor: statusRed,
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("500 Server error"),
          backgroundColor: statusRed,
        ));
      }
      Navigator.of(context).pop();
    }
  }
}

class ListDokterContent extends StatefulWidget {
  final List<Dokter> listDokter;
  final Object jadwal;

  const ListDokterContent(
      {Key? key, required this.listDokter, required this.jadwal})
      : super(key: key);

  @override
  _ListDokterContentState createState() => _ListDokterContentState();
}

class _ListDokterContentState extends State<ListDokterContent> {
  var _jadwal;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _jadwal = widget.jadwal;
  }

  void onDoctorCardTapped(Dokter dokter) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailDokter(
          dokter: dokter,
          tanggal: _jadwal['rawTgl'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Daftar dokter pada " +
                _jadwal["hari"] +
                " " +
                DateFormat("d MMMM y", "id_ID").format(_jadwal["rawTgl"]) +
                ", " +
                _jadwal["waktu"] +
                " WIB",
            style: getDefaultTextStyle(font_size: 14, font_color: blackColor),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final dokter = widget.listDokter[index];
                return GestureDetector(
                  onTap: () => onDoctorCardTapped(dokter),
                  child: DoctorCard(
                    dokter: dokter,
                  ),
                );
              },
              childCount: widget.listDokter.length,
            ),
          ),
        ),
      ],
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Dokter dokter;

  const DoctorCard({
    Key? key,
    required this.dokter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: normalWhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: grey,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(dokter.foto),
                radius: 30,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dokter.nama,
                      style: getDefaultTextStyle(font_size: 15),
                    ),
                    SizedBox(height: 5),
                    Text(
                      dokter.bidang,
                      style: getDefaultTextStyle(font_size: 13),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
