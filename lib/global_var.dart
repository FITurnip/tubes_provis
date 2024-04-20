import 'package:flutter/material.dart';
import 'package:tubes/Model/user.dart';
import 'package:tubes/theme.dart';

List list_wel = [
  {
    "header": "SIRAJA",
    "description":
        "Kami dengan bangga menyambut Anda dalam perjalanan menuju kesehatan yang lebih baik.",
    "image": "assets/img/Hospital.png"
  },
  {
    "header": "SIRAJA",
    "description":
        "Anda dapat dengan cepat dan efisien mengatur janji temu dengan dokter, mengakses riwayat kesehatan Anda, dan menjaga kesehatan Anda dengan lebih baik.",
    "image": "assets/img/Konsultasi.png"
  },
  {
    "header": "SIRAJA",
    "description":
        "Aplikasi ini didedikasikan untuk memberikan Anda akses mudah dan nyaman ke layanan kesehatan berkualitas.",
    "image": "assets/img/Ambulance.png"
  }
];
User? authUser;
final loadingDialog = AlertDialog(
  content: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      CircularProgressIndicator(),
      SizedBox(
        height: 16,
      ),
      Text(
        "Loading",
        style: getDefaultTextStyle(font_size: 14),
      )
    ],
  ),
);
