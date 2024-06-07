import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tubes/Model/kota.dart';
import 'package:tubes/Model/provinsi.dart';
import 'package:tubes/Services/network.dart';

class LokasiControlProvider extends ChangeNotifier {
  List<Provinsi> _listProvinsi = [];
  List<Kota> _listKota = [];
  
  List<Provinsi> get listProvinsi => _listProvinsi;
  List<Kota> get listKota => _listKota;

  Future<void> fetchProvinsi() async {
    try {
      _listProvinsi.clear();
      final resp = await Network().getData([], 'masterdata/list-provinsi');
      final data = jsonDecode(resp.body);
      for (var element in data['data']) {
        _listProvinsi.add(Provinsi.fromJson(element));
      }
      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchKota(int uid_provinsi) async {
    try {
      _listKota.clear();
      final resp = await Network().getData([], 'masterdata/list-kota?uid_provinsi=${uid_provinsi}');
      final data = jsonDecode(resp.body);
      for (var element in data['data']) {
        _listKota.add(Kota.fromJson(element));
      }
      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }
}
