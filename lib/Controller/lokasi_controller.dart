import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tubes/Model/provinsi.dart';
import 'package:tubes/Services/network.dart';

class LokasiControlProvider extends ChangeNotifier {
  List<Provinsi> _listProvinsi = [];
  bool _isFetch = false;
  
  List<Provinsi> get listProvinsi => _listProvinsi;
  bool get isFetch => _isFetch;
  Provinsi? current_created;

  Future<void> fetchProvinsi() async {
    try {
      _listProvinsi.clear();
      final resp = await Network().getData([], 'masterdata/list-provinsi');
      final data = jsonDecode(resp.body);
      for (var element in data['data']) {
        _listProvinsi.add(Provinsi.fromJson(element));
      }
      _isFetch = true;
      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }
}
