import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes/Widget/selection_boxes.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Services/network.dart';
import 'dart:convert';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  bool _obscureText = true;
  bool? isChecked = false;
  String dropdownValueProvinsi = 'Jawa Barat';
  String dropdownValueKota = 'Bandung';

  var email, no_telp, password, nik, nama_lengkap, jenis_kelamin = 'Laki-laki', tempat_lahir = 3273, tanggal_lahir, file_bpjs = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Email",
                style: getDefaultTextStyle(font_weight: FontWeight.w600),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: blackColor)),
              ),
              child: TextFormField(
                style: getDefaultTextStyle(),
                decoration: InputDecoration(
                  border: InputBorder.none, hintText: "Masukkan Email Anda"),
                validator: (email_value) {
                  if (email_value!.isEmpty) {
                    return 'Email wajib diisi!';
                  }
                  email = email_value;
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Nomor Telepon",
                style: getDefaultTextStyle(font_weight: FontWeight.w600),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: blackColor)),
              ),
              child: Center(
                child: TextFormField(
                  style: getDefaultTextStyle(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Masukkan Nomor Telepon",
                    prefixIcon: Container(
                      width: 55,
                      height: 0,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: defBlue,
                      ),
                      child: Text("+62",
                          style: getDefaultTextStyle(
                              font_size: 13,
                              font_color: normalWhite,
                              font_weight: FontWeight.w700)),
                    ),
                  ),
                  validator: (no_telp_value) {
                    if (no_telp_value!.isEmpty) {
                      return 'Nomor Telepon wajib diisi!';
                    }
                    no_telp = '+62' + no_telp_value;
                    return null;
                  },
                ),
              ),
            ),

            //disini buat password
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Password",
                style: getDefaultTextStyle(font_weight: FontWeight.w600),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: blackColor)),
              ),
              child: TextFormField(
                obscureText: _obscureText,
                style: getDefaultTextStyle(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Masukkan Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: basicYellow,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                validator: (password_value) {
                  if (password_value!.isEmpty) {
                    return 'Password wajib diisi!';
                  }
                  password = password_value;
                  return null;
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Nomor Induk Kependudukan",
                style: getDefaultTextStyle(font_weight: FontWeight.w600),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: blackColor)),
              ),
              child: TextFormField(
                style: getDefaultTextStyle(),
                decoration: InputDecoration(
                  border: InputBorder.none, hintText: "Masukkan NIK Anda"),
                validator: (nik_value) {
                  if (nik_value!.isEmpty) {
                    return 'NIK wajib diisi!';
                  }
                  nik = nik_value;
                  return null;
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Nama Lengkap",
                style: getDefaultTextStyle(font_weight: FontWeight.w600),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: blackColor)),
              ),
              child: TextFormField(
                style: getDefaultTextStyle(),
                decoration: InputDecoration(
                  border: InputBorder.none, hintText: "Masukkan Nama Anda"),
                validator: (nama_lengkap_value) {
                  if (nama_lengkap_value!.isEmpty) {
                    return 'Nama wajib diisi!';
                  }
                  nama_lengkap = nama_lengkap_value;
                  return null;
                },
              ),
            ),

            //ini ku si klin can beres urg nyokot nu si klin
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Jenis Kelamin",
                style: getDefaultTextStyle(font_weight: FontWeight.w600),
              ),
            ),

            SelectionBoxes(options: ["Laki-laki", "Perempuan"],
            onOptionSelected: ((jenis_kelamin_value) {
              jenis_kelamin = (jenis_kelamin_value == 0 ? 'Laki-laki' : 'Perempuan');
            }),),

            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Tempat Tanggal Lahir",
                style: getDefaultTextStyle(font_weight: FontWeight.w600),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: defBlue,
                    borderRadius: BorderRadius.circular(22.7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: dropdownValueProvinsi,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: normalWhite,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: getDefaultTextStyle(
                              font_color: normalWhite,
                              font_weight: FontWeight.w600),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValueProvinsi = newValue!;
                            });
                          },
                          items: [
                            DropdownMenuItem<String>(
                              value: 'Jawa Barat',
                              child: Text(
                                'Jawa Barat',
                                style: TextStyle(
                                  color: dropdownValueProvinsi == 'Jawa Barat'
                                      ? normalWhite
                                      : defBlue,
                                ),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Jawa Timur',
                              child: Text(
                                'Jawa Timur',
                                style: TextStyle(
                                  color: dropdownValueProvinsi == 'Jawa Timur'
                                      ? normalWhite
                                      : defBlue,
                                ),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Jawa Tengah',
                              child: Text(
                                'Jawa Tengah',
                                style: TextStyle(
                                  color: dropdownValueProvinsi == 'Jawa Tengah'
                                      ? normalWhite
                                      : defBlue,
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: defBlue,
                    borderRadius: BorderRadius.circular(22.7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: dropdownValueKota,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: normalWhite,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: getDefaultTextStyle(
                              font_color: normalWhite,
                              font_weight: FontWeight.w600),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValueKota = newValue!;
                            });
                          },
                          items: [
                            DropdownMenuItem<String>(
                              value: 'Bandung',
                              child: Text(
                                'Bandung',
                                style: TextStyle(
                                  color: dropdownValueKota == 'Bandung'
                                      ? normalWhite
                                      : defBlue,
                                ),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Surabaya',
                              child: Text(
                                'Surabaya',
                                style: TextStyle(
                                  color: dropdownValueKota == 'Surabaya'
                                      ? normalWhite
                                      : defBlue,
                                ),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Brebes',
                              child: Text(
                                'Brebes',
                                style: TextStyle(
                                  color: dropdownValueKota == 'Brebes'
                                      ? normalWhite
                                      : defBlue,
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),

            Row(
              children: [
                // ElevatedButton sebagai tombol untuk date picker
                GestureDetector(
                  onTap: () {
                    _selectDate();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: defBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: blackColor)),
                    ),
                    child: TextFormField(
                      controller: _dateController,
                      style: getDefaultTextStyle(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Pilih Tanggal',
                      ),
                      enabled: false, // meh teu bisa di klik
                      validator: (tanggal_lahir_value) {
                        if (tanggal_lahir_value!.isEmpty) {
                          return 'Tanggal lahir wajib diisi!';
                        }
                        tanggal_lahir = tanggal_lahir_value;
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "BPJS",
                style: getDefaultTextStyle(font_weight: FontWeight.w600),
              ),
            ),

            GestureDetector(
              onTap: () {
                // buat upload gambar
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: defBlue,
                      width: 5,
                    ),
                  ),
                  alignment: Alignment.center,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload_file,
                        size: 40,
                        color: defBlue,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Unggah Kartu BPJS",
                        style: getDefaultTextStyle(font_color: defBlue),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Nomor BPJS",
                style: getDefaultTextStyle(font_weight: FontWeight.w600),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: blackColor)),
              ),
              child: TextFormField(
                style: getDefaultTextStyle(),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Masukkan Nomor BPJS Anda"),
              ),
            ),

            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  activeColor: defBlue,
                  onChanged: (newBool) {
                    setState(() {
                      isChecked = newBool;
                    });
                  },
                ),
                Text(
                  "Tekan Jika Tidak Mempunyai Kartu BPJS",
                  style: getDefaultTextStyle(),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: normalWhite,
                    backgroundColor: defBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                    minimumSize: Size(170, 40),
                    elevation: 3,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _makeNewAccount();
                      });
                    }
                  },
                  child: Text(
                    "Simpan",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2050));

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _makeNewAccount() async {
    var data = {
      'name' : nama_lengkap,
      'email' : email,
      'password' : password,
      'nik' : nik,
      'jenkel' : jenis_kelamin,
      'tgl_lahir' : tanggal_lahir,
      'tempat_lahir' : tempat_lahir,
      'no_telp'  : no_telp,
      'foto' : file_bpjs,
      'file_bpjs' : file_bpjs
    };

    var res = await Network().postData(data, 'register');

    if (res is String) {
      _showMsg(res);
    } else {
      var body = json.decode(res.body);
      if(body.containsKey('success')) {
        if(body['success']) {
          _showMsg(body['message']);
        } else {
          print(body['data']);
          _showMsg(body['data']);
        }
      } else {
        _showMsg('500 Server Error');
      }
    }
  }
}