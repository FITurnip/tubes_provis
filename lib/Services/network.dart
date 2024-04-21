import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tubes/global_var.dart';

class Network {
  // final String _baseurl = 'http://192.168.1.11';
  final String _baseurl = 'http://192.168.148.23';
  // final String _baseurl = 'http://192.168.1.21';
  // final String _baseurl = 'http://192.168.1.11';
  // final String _baseurl = 'http://127.0.0.1';
  final String _port = '8000';
  final String _prefix = '/api';
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
  }

  auth(data, endPoint) async {
    var fullUrl = Uri.parse(_baseurl + ':' + _port + _prefix + '/' + endPoint);
    try {
      return await http.post(
        fullUrl,
        body: jsonEncode(data),
        headers: _setHeaders(),
      );
    } catch (e) {
      return 'Tidak dapat terhubung ke ' + _baseurl;
    }
  }

  postData(data, endPoint) async {
    var fullUrl = Uri.parse(_baseurl + ':' + _port + _prefix + '/' + endPoint);
    await _getToken();
    try {
      return await http.post(
        fullUrl,
        body: jsonEncode(data),
        headers: _setHeaders(),
      );
    } catch (e) {
      return 'Tidak dapat terhubung ke ' + _baseurl;
    }
  }

  //kalau pake get ini semua didalem parameter data harus string
  getData(data, endPoint) async {
    var fullUrl = _baseurl + ':' + _port + _prefix + '/' + endPoint;
    var uriUrl = Uri.parse(fullUrl);
    if (data.isNotEmpty) {
      uriUrl = uriUrl.replace(queryParameters: data);
    }
    await _getToken();
    try {
      return await http.get(uriUrl, headers: _setHeaders());
    } catch (e) {
      return 'Tidak dapat terhubung ke ' + _baseurl;
    }
  }

  accessFile(endPoint, {returnType = "url"}) async {
    var fullUrl = _baseurl + ':' + _port + '/storage' + '/' + endPoint;
    if (returnType == "url") {
      return fullUrl;
    } else {
      try {
        var uriUrl = Uri.parse(fullUrl);
        return await http.get(uriUrl, headers: _setHeaders());
      } catch (e) {
        return 'Tidak dapat terhubung ke ' + _baseurl;
      }
    }
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${token == null ? token : token.replaceAll('"', '')}'
      };
}
