import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes/Model/provinsi.dart';
import 'package:tubes/Model/kota.dart';
import 'package:tubes/Pages/login_page.dart';
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
  int indexProvinsi = 0;
  int indexKota = 0;

  var email, no_telp, password, nik, nama_lengkap, jenis_kelamin = 'Laki-laki', uid_provinsi = 75, uid_kota = 7504, tanggal_lahir, file_bpjs = '';
  
  late Future<List<Provinsi>> futureListProvinsi;
  List<Provinsi> listProvinsi = [];
  late Future<List<Kota>> futureListKota;
  List<Kota> listKota = [];

  @override
  void initState() {
    super.initState();
    futureListProvinsi = _getProvinsi();
    futureListKota = _getKota(uid_provinsi);
  }

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

            Container(
              decoration: BoxDecoration(
                color: defBlue,
                borderRadius: BorderRadius.circular(22.7),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: DropdownButtonHideUnderline(
                  child: FutureBuilder<List<Provinsi>>(
                    future: futureListProvinsi,
                    builder: (BuildContext context, AsyncSnapshot<List<Provinsi>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return DropdownButton<int>(
                          value: indexProvinsi,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: normalWhite,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: getDefaultTextStyle(
                            font_color: normalWhite,
                            font_weight: FontWeight.w600,
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              bool indexGetChange = false;
                              if(indexProvinsi != newValue) indexGetChange = true;
                              indexProvinsi = newValue!;
                              uid_provinsi = listProvinsi[indexProvinsi].uidProvinsi;
                              if(indexGetChange) futureListKota = _getKota(uid_provinsi);
                            });
                          },
                          items: snapshot.data!.asMap().entries.map<DropdownMenuItem<int>>((entry) {
                            int index = entry.key;
                            Provinsi provinsi = entry.value;
                            return DropdownMenuItem<int>(
                              value: index,
                              child: Text(
                                provinsi.nama,
                                style: TextStyle(
                                  color: indexProvinsi == index ? normalWhite : defBlue,
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: defBlue,
                borderRadius: BorderRadius.circular(22.7),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: DropdownButtonHideUnderline(
                  child: FutureBuilder<List<Kota>>(
                    future: futureListKota,
                    builder: (BuildContext context, AsyncSnapshot<List<Kota>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return DropdownButton<int>(
                          value: indexKota,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: normalWhite,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: getDefaultTextStyle(
                            font_color: normalWhite,
                            font_weight: FontWeight.w600,
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              indexKota = newValue!;
                              uid_kota = listKota[indexKota].uidKota;
                            });
                          },
                          items: snapshot.data!.asMap().entries.map<DropdownMenuItem<int>>((entry) {
                            int index = entry.key;
                            Kota kota = entry.value;
                            return DropdownMenuItem<int>(
                              value: index,
                              child: Text(
                                kota.namaKota,
                                style: TextStyle(
                                  color: indexKota == index ? normalWhite : defBlue,
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                ),
              ),
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
                        print('berhasil');
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

  void _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _makeNewAccount() async {
    print('uid_provinsi');
    var data = {
      'name' : nama_lengkap,
      'email' : email,
      'password' : password,
      'nik' : nik,
      'jenkel' : jenis_kelamin,
      'tgl_lahir' : tanggal_lahir,
      'tempat_lahir' : uid_kota,
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
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginPage())));
        } else {
          _showMsg(body['data']);
        }
      } else {
        _showMsg('500 Server Error');
      }
    }
  }

  Future<List<Provinsi>> _getProvinsi() async {
    var res = await Network().getData({}, 'masterdata/list-provinsi');
    if (res is String) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res),
        backgroundColor: statusRed,
      ));
      return [];
    } else {
      var body = json.decode(res.body);
      if (body.containsKey('success') && body['success']) {
        List<dynamic> data = body['data'];
        listProvinsi = data.map((item) => Provinsi.fromJson(item)).toList();
        return listProvinsi;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(body['message'] ?? 'Failed to fetch data'),
          backgroundColor: statusRed,
        ));
        return [];
      }
    }
  }

  Future<List<Kota>> _getKota(int uidProvinsi) async {
    var res = await Network().getData({}, 'masterdata/list-kota?uid_provinsi=' + uidProvinsi.toString());
    if (res is String) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res),
        backgroundColor: statusRed,
      ));
      return [];
    } else {
      var body = json.decode(res.body);
      print(body);
      if (body.containsKey('success') && body['success']) {
        List<dynamic> data = body['data'];
        listKota = data.map((item) => Kota.fromJson(item)).toList();
        return listKota;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(body['message'] ?? 'Failed to fetch data'),
          backgroundColor: statusRed,
        ));
        return [];
      }
    }
  }
}