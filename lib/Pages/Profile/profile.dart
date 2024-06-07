import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes/Model/pasien.dart';
import 'package:tubes/Model/user.dart';
import 'package:tubes/Pages/Auth/login_page.dart';
import 'package:tubes/Pages/Profile/list_keluarga.dart';
import 'package:tubes/Services/network.dart';
import 'package:tubes/Widget/notifcation_dialog.dart';
import 'package:tubes/Widget/selection_boxes.dart';
import 'package:tubes/Widget/store_update_pasien.dart';
import 'package:tubes/global_var.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/rounded_image.dart';

// enum gender { pria, wanita }

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _nomorBpjs = "";
  String? _selectedOption;
  String labelText = "Email";
  var email, name;
  bool _isLoading = false;
  var jenis_kelamin = 'Laki-laki';
  late double mediaWidth;

  @override
  Widget build(BuildContext context) {
    mediaWidth = MediaQuery.of(context).size.width - (defaultEdgeInsetScreen * 3);

    return Container(
      // padding: ,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StoreUpdatePasien(url: 'profile/storeUpdate', withEmail: false, withPassword: false, pasien: authUser!.detailPasien, function: () async {updateUserLocalData();}),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListKeluarga()),
                    )
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: basicYellow,
                    padding: EdgeInsets.zero, // Hapus padding default
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: IntrinsicWidth(
                    // Tambahkan IntrinsicWidth
                    child: Row(
                      mainAxisSize: MainAxisSize
                          .min, // Atur mainAxisSize ke MainAxisSize.min
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20), // Atur padding di dalam row
                          child: Text(
                            'Daftar Anggota Keluarga',
                            textAlign: TextAlign.center,
                            style: getDefaultTextStyle(
                                font_color: normalWhite,
                                font_weight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10), // Tambahkan padding untuk icon
                          child: Icon(
                            Icons.arrow_right_alt_rounded,
                            color: normalWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => NotifcationDialog(Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 50.0),
                                  child: Text("Anda yakin ingin keluar?",
                                      textAlign: TextAlign.center,
                                      style: getDefaultTextStyle(
                                          font_size: 15.0,
                                          font_weight: FontWeight.bold,
                                          font_color: normalWhite)),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () => logout(context),
                                      child: Text(
                                        "Yakin",
                                        style: getDefaultTextStyle(
                                            font_color: statusRed),
                                      ),
                                    ),
                                    ElevatedButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("Batalkan",
                                            style: getDefaultTextStyle())),
                                  ],
                                )
                              ],
                            )));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: statusRed,
                  ),
                  child: Text('Log out',
                      style: getDefaultTextStyle(
                        font_color: normalWhite,
                        font_weight: FontWeight.w600,
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void logout(BuildContext context) async {
    var data = {};
    var res = await Network().postData(data, 'logout');
    print("proses 1");
    if (res is String) {
      _showMsg(res);
    } else {
      var body = json.decode(res.body);
      print("proses 2");
      if (body.containsKey('data')) {
        if (body['data']) {
          Network().removeToken();
          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => LoginPage())));
        } else {
          print("Failed to logout");
        }
      } else {
        print("Failed to logout");
      }
    }
  }

  Map<String, dynamic> replaceNullWithEmptyString(Map<String, dynamic> json) {
    json.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        replaceNullWithEmptyString(value);
      } else if (value == null) {
        json[key] = '';
      } else if (value is List) {
        json[key] = value.map((item) {
          if (item is Map<String, dynamic>) {
            return replaceNullWithEmptyString(item);
          }
          return item;
        }).toList();
      }
    });
    return json;
  }

  void updateUserLocalData() async {
    var res = await Network().getData({}, 'user-info');
    if (res is String) {
      _showMsg(res);
    } else {
      var body = json.decode(res.body);
      if (body.containsKey('success')) {
        if (body['success']) {
          print(body["data"]);
          SharedPreferences localStorage =
              await SharedPreferences.getInstance();
          var userInfo = replaceNullWithEmptyString(body['data']);
          localStorage.setString(
              'user', json.encode(userInfo));
          Pasien detailUser = Pasien.fromJson(userInfo['detail_profile']);
          var token = authUser!.getToken;
          setState(() {
            authUser = User(userInfo['id'], userInfo['name'], userInfo['email'],
                userInfo['role'], detailUser, token);
          });
        } else {
          _showMsg(body['data']['error']);
        }
      } else {
        _showMsg("500 Server error");
      }
    }
  }
}