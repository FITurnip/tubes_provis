import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Network {
  // final String _baseurl = 'http://192.168.1.24';
  final String _baseurl = 'http://192.168.1.26';
  final String _port = '8000';
  final String _prefix = '/api';
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
  }

  removeToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');
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
      return e.toString();
      return 'Tidak dapat terhubung ke ' + _baseurl;
    }
  }

  postMultipartData(
      Map<String, dynamic> data, File? image, String endPoint) async {
    var fullUrl = Uri.parse('$_baseurl:$_port$_prefix/$endPoint');
    await _getToken();
    var request = http.MultipartRequest('POST', fullUrl);

    // Add form fields
    data.forEach((key, value) {
      request.fields[key] = value;
    });

    // Add file
    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath('foto', image.path));
    }

    request.headers.addAll(_setHeaders());

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      return response;
    } catch (e) {
      return e.toString();
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

  getUrlFile(endPoint) {
    String url = _baseurl + ':' + _port + '/storage' + '/' + endPoint;
    return url;
  }

  String getStorageUrl(endPoint) {
    String fullUrl = _baseurl + ':' + _port + '/storage' + '/' + endPoint;
    return fullUrl;
  }

  accessFile(endPoint, {returnType = "url"}) async {
    String fullUrl = _baseurl + ':' + _port + '/storage' + '/' + endPoint;
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
