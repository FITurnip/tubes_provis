import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tubes/Model/kunjungan.dart'; // Sesuaikan dengan path file model Kunjungan
import 'package:tubes/Services/network.dart';
import 'package:tubes/global_var.dart';

class KunjunganProvider extends ChangeNotifier {
  List<Kunjungan> daftarKunjungan = [];

  Future<void> getDetailKunjungan(int id) async {
    try {
      final resp = await Network().getData({}, 'list-detail-kunjungan/$id');
      final data = jsonDecode(resp.body);
      daftarKunjungan.clear();
      for (var element in data['data']) {
        daftarKunjungan.add(Kunjungan.fromJson(element));
      }
      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }
}
