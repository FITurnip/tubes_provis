import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tubes/Model/janji_temu.dart';
import 'package:tubes/Model/pasien.dart';
import 'package:tubes/Services/network.dart';
import 'package:tubes/global_var.dart';

class JanjiTemuControlProvider extends ChangeNotifier {
  List<JanjiTemu> _listJanjiTemu = [];
  bool _isFetch = false;
  List<JanjiTemu> get listJanjiTemu => _listJanjiTemu;
  bool get isFetch => _isFetch;
  Future<void> fetchJanjiTemu() async {
    try {
      _listJanjiTemu.clear();
      final resp = await Network().getData([], 'list-janji-temu');
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

  Future<bool> buatJanjiTemu({required request}) async {
    try {
      final resp = await Network().postData(request, 'buat-janji');
      final data = jsonDecode(resp.body);
      print(data);
      if (data is String) {
        return false;
      }
      if (data['success']) {
        fetchJanjiTemu();
        return true;
      }
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
