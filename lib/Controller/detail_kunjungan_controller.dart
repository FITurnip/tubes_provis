import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tubes/Model/kunjungan.dart'; 
import 'package:tubes/Services/network.dart';
import 'package:tubes/global_var.dart';

class KunjunganProvider extends ChangeNotifier {
  List<Kunjungan> _daftarKunjungan = [];
  bool _isFetch = false;
  bool _hasError = false;

  List<Kunjungan> get daftarKunjungan => _daftarKunjungan;
  bool get isFetch => _isFetch;
  bool get hasError => _hasError;
  Kunjungan? current_created;

  Future<void> getDetailKunjungan(int id) async {
    try {
      _isFetch = false;
      _hasError = false;
      _daftarKunjungan.clear();
      notifyListeners();
      
      final resp = await Network().getData({}, 'list-detail-kunjungan/$id');
      final data = jsonDecode(resp.body);
      for (var element in data['data']) {
        _daftarKunjungan.add(Kunjungan.fromJson(element));
      }
      _isFetch = true;
    } catch (e) {
      _hasError = true;
      print('Error: $e');
    }
    notifyListeners();
  }
}
