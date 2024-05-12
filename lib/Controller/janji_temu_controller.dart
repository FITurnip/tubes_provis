import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tubes/Model/pasien.dart';
import 'package:tubes/Services/network.dart';
import 'package:tubes/global_var.dart';

class JanjiTemuControlProvider extends ChangeNotifier {
  List<Pasien> daftarPasien = [];

  Future<void> getKeluarga() async {
    try {
      daftarPasien.clear();
      daftarPasien.add(authUser!.detailPasien);
      final resp = await Network()
          .getData({'is_keluarga': 'true'}, 'masterdata/list-pasien-keluarga');
      // print(resp);
      final data = jsonDecode(resp.body);
      for (var element in data['data']) {
        daftarPasien.add(Pasien.fromJson(element));
      }

      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }
}
