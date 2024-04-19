import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tubes/global_var.dart';

class Network {
  final String _baseurl = 'http://192.168.1.11';
  final String _port = '8000';
  final String _prefix = '/api';
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
  }

  auth(data, endPoint) async {
    var fullUrl = Uri.parse(_baseurl + ':' + _port + _prefix + '/' + endPoint);
    return await http.post(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  postData(data, endPoint) async {
    var fullUrl = Uri.parse(_baseurl + ':' + _port + _prefix + '/' + endPoint);
    await _getToken();
    return await http.post(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  //kalau pake get ini semua didalem parameter data harus string
  getData(data, endPoint) async {
    var fullUrl = _baseurl + ':' + _port + _prefix + '/' + endPoint;
    var uriUrl = Uri.parse(fullUrl);
    if (data.isNotEmpty) {
      uriUrl = uriUrl.replace(queryParameters: data);
    }
    await _getToken();
    return await http.get(uriUrl, headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${token == null ? token : token.replaceAll('"', '')}'
      };
}
