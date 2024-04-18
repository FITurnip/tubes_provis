import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Network {
  final String _baseurl = 'http://127.0.0.1';
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

  getData(endPoint) async {
    var fullUrl = _baseurl + ':' + _port + _prefix + '/' + endPoint;
    await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
