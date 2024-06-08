import 'package:tubes/Model/janji_temu.dart';
import 'package:tubes/Pages/Pasien/template.dart';
import 'package:tubes/Widget/expansible_list.dart';
import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class PaymentOption {
  final String name;
  final String image;

  PaymentOption({required this.name, required this.image});
}

List<PaymentOption> paymentOptions = [
  PaymentOption(name: 'Dana', image: 'assets/img/pembayaran/DANA.png'),
  PaymentOption(name: 'OVO', image: 'assets/img/pembayaran/Ovo.png'),
  PaymentOption(name: 'Link Aja', image: 'assets/img/pembayaran/LinkAja.png'),
  PaymentOption(
      name: 'ShopeePay', image: 'assets/img/pembayaran/Shopee_pay.png'),
  PaymentOption(name: 'Gopay', image: 'assets/img/pembayaran/Gopay.png'),
];

class Pembayaran extends PasienTemplate {
  Pembayaran({required JanjiTemu janji_temu})
      : super(title: "Pembayaran", pasienTemplateItems: [], qrData: "", janjiTemu: janji_temu) {
    qrData = "Hello World";
    pasienTemplateItems = [
      ExpansibleItem(
          icon: Icon(Icons.person),
          headerValue: "Invoice",
          expandedValue: Container(
            child: GestureDetector(
              onTap: () {
                // buat upload gambar
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: blackColor,
                      width: 5,
                    ),
                  ),
                  alignment: Alignment.center,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload_file,
                        size: 40,
                        color: blackColor,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Unggah Bukti Pembayaran",
                        style: getDefaultTextStyle(font_color: blackColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          isExpanded: true),
      ExpansibleItem(
          icon: Icon(Icons.assignment),
          headerValue: "Pembayaran, Total: Rp.500.000.,",
          expandedValue: GridView.builder(
            padding: EdgeInsets.all(8.0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // Number of items per row
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: paymentOptions.length,
            itemBuilder: (context, index) {
              final paymentOption = paymentOptions[index];
              return GestureDetector(
                onTap: () {
                  print('${paymentOption.name} diklik');
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(paymentOption.image),
                    ),
                    SizedBox(height: 8),
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
    ];
  }
}
