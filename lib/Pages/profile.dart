import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes/Model/pasien.dart';
import 'package:tubes/Model/user.dart';
import 'package:tubes/Pages/form_tambah_keluarga.dart';
import 'package:tubes/Pages/list_keluarga.dart';
import 'package:tubes/Services/network.dart';
import 'package:tubes/Widget/pressable_widget.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/rounded_image.dart';
import 'package:tubes/Widget/tambah_keluarga.dart';

enum gender { pria, wanita }

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _nomorBpjs = "";
  gender? genderSelected;
  String? _selectedOption;
  String labelText = "Email";
  var email, name;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: RoundedImage(
                    imagePath: 'assets/img/photo_profile.png',
                    size: 100.0,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Samdysara Saragih",
                      // name ?? "name tidak tersedia",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Text(
                      DateFormat("d MMMM y", "id_ID").format(
                        DateTime.parse('2024-01-08 09:45:00'),
                      ),
                    ),
                    Text(
                      "samdysara@gmail.com",
                      // email ?? "Email tidak tersedia",
                      style: getDefaultTextStyle(
                        font_color: blackColor,
                      ),
                    ),
                    // TextFormField(
                    //   cursorColor: Colors.white,
                    //   keyboardType: TextInputType.text,
                    //   style: getDefaultTextStyle(font_color: normalWhite),
                    //   decoration: InputDecoration(
                    //       enabledBorder: UnderlineInputBorder(
                    //         borderSide: BorderSide(color: normalWhite),
                    //       ),
                    //       focusedBorder: UnderlineInputBorder(
                    //           borderSide: BorderSide(color: normalWhite))),
                    //   validator: (emailvalue) {
                    //     if (emailvalue!.isEmpty) {
                    //       return 'Email wajib diisi!';
                    //     }
                    //     email = emailvalue;
                    //     return null;
                    //   },
                    // ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Image.asset(
                  'assets/img/bpjs.png',
                  width: 184.56,
                  height: 114.43,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika untuk mengganti foto di sini
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: basicYellow,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: basicYellow),
                        ),
                      ),
                      child: Text(
                        'Ganti Foto',
                        style: TextStyle(
                          color: normalWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            FormInput(
                label: "Nomor BPJS",
                widget: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Masukkan Nomor BPJS",
                  ),
                )),
            FormInput(label: "Jenis Kelamin", widget: SelectionBox()),
            FormInput(
                label: "Nomor Telepon",
                widget: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Masukkan Nomor Telepon",
                  ),
                )),
            FormInput(
                label: "Kata Sandi",
                widget: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Masukkan Kata Sandi",
                  ),
                )),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailKeluarga()),
                  )
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: basicYellow,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'List Anggota Keluarga',
                  style: TextStyle(
                    color: Colors.white, // Warna teks putih
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // _showMsg(msg) {
  //   final snackBar = SnackBar(
  //     content: Text(msg),
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  // void _profil() async {
  //   if (!_isLoading) {
  //     setState(() {
  //       _isLoading = true;
  //     });

  //     // Panggil API untuk mengambil data profil
  //     var data = {'email': email};
  //     var res = await Network().postData(data, 'register');

  //     if (res is String) {
  //       // Jika gagal, tampilkan pesan error
  //       _showMsg(res);
  //     } else {
  //       var body = json.decode(res.body);
  //       // Pastikan respons memiliki data profil yang diperlukan, misalnya email
  //       if (body.containsKey('success')) {
  //         if (body['success']) {
  //           SharedPreferences localStorage =
  //               await SharedPreferences.getInstance();
  //           localStorage.setString('token', json.encode(body['data']['token']));
  //           localStorage.setString(
  //               'user', json.encode(body['data']['user_info']));
  //           var userInfo = body['data']['user_info'];
  //           User detailUser = User(
  //             userInfo['user_info']['id'],

  //           );
  //         }
  //         // Simpan email yang diambil dari respons API
  //         setState(() {
  //           email = body['email'];
  //         });
  //       } else {
  //         // Jika tidak ada email dalam respons, tampilkan pesan error
  //         _showMsg("Email tidak ditemukan dalam respons");
  //       }
  //     }
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }
}

class FormInput extends StatelessWidget {
  String _formInput = "";
  final String label;
  Widget? widget;

  FormInput({required this.label, this.widget});

  @override
  Widget build(BuildContext context) {
    if (widget == null) {
      widget = Container(
          height: 38,
          child: TextField(
            style: getDefaultTextStyle(),
            decoration: InputDecoration(contentPadding: EdgeInsets.zero),
            onChanged: (text) {
              _formInput = text;
            },
          ));
    }

    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            label,
            style: getDefaultTextStyle(),
          ),
          Container(child: widget),
        ]));
  }
}

// bagian ini nanti buat jadi component sendiri
class SelectionBox extends StatelessWidget {
  double borderRadius = 10.0;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      PressableWidget(
          onPressed: () {},
          child: Container(
              padding: EdgeInsets.all(2.0),
              margin: EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: defBlue,
              ),
              child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    color: defBlue,
                  ),
                  child: Text("Laki-laki",
                      style: TextStyle(color: Colors.white))))),
      SizedBox(width: 10),
      PressableWidget(
          onPressed: () {},
          child: Container(
              padding: EdgeInsets.all(2.0),
              margin: EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: basicYellow,
              ),
              child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    border: Border.all(
                      color: basicYellow,
                      width: 1.0,
                    ),
                    color: basicYellow,
                  ),
                  child: Text("Perempuan",
                      style: TextStyle(color: Colors.white))))),
    ]);
  }
}
