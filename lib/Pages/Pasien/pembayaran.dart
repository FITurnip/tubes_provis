import 'package:provider/provider.dart';
import 'package:tubes/Controller/detail_kunjungan_controller.dart';
import 'package:tubes/Model/janji_temu.dart';
import 'package:tubes/Model/keluhan.dart';
import 'package:tubes/Model/kunjungan.dart';
import 'package:tubes/Pages/Pasien/template.dart';
import 'package:tubes/Services/network.dart';
import 'package:tubes/Widget/notifcation_dialog.dart';
import 'package:tubes/Widget/expansible_list.dart';
import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';
import 'dart:convert';

class PaymentOption {
  final String name;
  final String image;

  PaymentOption({required this.name, required this.image});
}

List<PaymentOption> paymentOptions = [
  PaymentOption(name: 'Dana', image: 'assets/img/pembayaran/dana.jpg'),
  PaymentOption(name: 'OVO', image: 'assets/img/pembayaran/ovo.jpg'),
  // PaymentOption(name: 'Link Aja', image: 'assets/img/pembayaran/LinkAja.png'),
  PaymentOption(
      name: 'ShopeePay', image: 'assets/img/pembayaran/Shopee_pay.png'),
  PaymentOption(name: 'Gopay', image: 'assets/img/pembayaran/Gopay.png'),
];

class Pembayaran extends PasienTemplate {
  final Kunjungan kunjungan;

  Pembayaran({required JanjiTemu janji_temu, required this.kunjungan})
      : super(
            title: "Pembayaran",
            pasienTemplateItems: [],
            qrData: "",
            janjiTemu: janji_temu,
            kunjungan: kunjungan) {
    qrData = "Hello World";
    pasienTemplateItems = [
      ExpansibleItem(
          icon: Icon(Icons.person),
          headerValue: "Invoice",
          expandedValue: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Resep Obat:",
                    style: getDefaultTextStyle(
                        font_size: 16, font_weight: FontWeight.bold)),
                if (kunjungan.resepObat.isEmpty)
                  Text("Tidak ada resep obat.", style: getDefaultTextStyle()),
                ...kunjungan.resepObat.map((resep) {
                  return ListTile(
                    title: Text(resep.masterObat.namaObat),
                    subtitle: Text(
                        "Jumlah: ${resep.jumlah}, Keterangan: ${resep.keterangan}"),
                    trailing:
                        Text("Rp. ${resep.masterObat.harga * resep.jumlah}"),
                  );
                }),
                SizedBox(height: 10),
                Text("Penunjang Medis:",
                    style: getDefaultTextStyle(
                        font_size: 16, font_weight: FontWeight.bold)),
                if (kunjungan.penunjangMedis.isEmpty)
                  Text("Tidak ada penunjang medis.",
                      style: getDefaultTextStyle()),
                ...kunjungan.penunjangMedis.map((penunjang) {
                  return ListTile(
                    title: Text(
                        penunjang.masterPenunjangMedis.jenisPenunjangMedis),
                    trailing:
                        Text("Rp. ${penunjang.masterPenunjangMedis.harga}"),
                    onTap: () {},
                  );
                }),
                SizedBox(height: 10),
                Text("Tarif Konsultasi:",
                    style: getDefaultTextStyle(
                        font_size: 16, font_weight: FontWeight.bold)),
                ListTile(
                  title: Text(janjiTemu.dokter.bidang),
                  trailing: Text("Rp. ${kunjungan.keluhan.tarifKonsultasi}"),
                ),
              ],
            ),
          ),
          isExpanded: true),
      ExpansibleItem(
        icon: Icon(Icons.assignment),
        headerValue: "Pembayaran, Total: Rp. ${kunjungan.totalHarga},",
        expandedValue: Container(
            child: GridView.builder(
          padding: EdgeInsets.all(8.0),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.8,
          ),
          itemCount: paymentOptions.length,
          itemBuilder: (context, index) {
            final paymentOption = paymentOptions[index];
            return GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => NotifcationDialog(Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 50.0),
                              child: Text("Lakukan Pembayaran?",
                                  textAlign: TextAlign.center,
                                  style: getDefaultTextStyle(
                                      font_size: 15.0,
                                      font_weight: FontWeight.bold,
                                      font_color: normalWhite)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    var data = {
                                      'status': 'selesai',
                                      'id_kunjungan': kunjungan.id
                                    };

                                    final resp = await Network()
                                        .postData(data, 'change-status');
                                    final respdata = jsonDecode(resp.body);
                                    print(respdata);
                                    if (respdata is String) {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: Text("Error"),
                                                content: Text(
                                                    "Terjadi Kesalahan: ${respdata}"),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                      child: Text("Oke"))
                                                ],
                                              ));
                                    }
                                    if (respdata['success']) {
                                      Provider.of<KunjunganProvider>(context,
                                              listen: false)
                                          .getDetailKunjungan(kunjungan.id);
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Text(
                                    "Yakin",
                                    style: getDefaultTextStyle(),
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("Batalkan",
                                        style: getDefaultTextStyle())),
                              ],
                            )
                          ],
                        )));
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: normalWhite,
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: normalWhite,
                      backgroundImage: AssetImage(paymentOption.image),
                    ),
                  ),
                  Text(
                    paymentOption.name,
                    style: getDefaultTextStyle(font_size: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        )),
      )
    ];
  }
}
