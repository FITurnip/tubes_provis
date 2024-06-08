import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tubes/Model/janji_temu.dart';
import 'package:tubes/Services/network.dart';

class JanjiTemuControlProvider extends ChangeNotifier {
  List<JanjiTemu> _listJanjiTemu = [];
  bool _isFetch = false;
  List<JanjiTemu> get listJanjiTemu => _listJanjiTemu;
  bool get isFetch => _isFetch;
  JanjiTemu? current_created;
  Future<void> fetchJanjiTemu({required bool isRiwayat}) async {
    try {
      _listJanjiTemu.clear();
      final resp = await Network().getData([], 'list-janji-temu?is_riwayat=$isRiwayat');
      print('list-janji-temu?is_riwayat=$isRiwayat');
      final data = jsonDecode(resp.body);
      for (var element in data['data']) {
        _listJanjiTemu.add(JanjiTemu.fromJson(element));
      }
      _isFetch = true;
      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<bool> buatJanjiTemu({required request, required bool isRiwayat}) async {
    try {
      final resp = await Network().postData(request, 'buat-janji');
      final data = jsonDecode(resp.body);
      if (data is String) {
        return false;
      }
      print(data);
      if (data['success']) {
        fetchJanjiTemu(isRiwayat: isRiwayat);
        current_created = JanjiTemu.fromJson(data['data']);
        return true;
      }
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
