import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Model/provinsi.dart';
import 'package:tubes/Model/kota.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes/Services/network.dart';
import 'package:tubes/Widget/selection_boxes.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  bool _obscureText = true;
  bool? isChecked = false;
  int indexProvinsi = 0;
  int indexKota = 0;

  Map<String, dynamic> dataInput = {
    "jenis_kelamin" : 'Laki-laki',
    "uid_provinsi" : 75,
    "uid_kota" : 7504,
    "file_bpjs" : '',
  };

  late Future<List<Provinsi>> futureListProvinsi;
  List<Provinsi> listProvinsi = [];
  late Future<List<Kota>> futureListKota;
  List<Kota> listKota = [];

  @override
  void initState() {
    super.initState();
    futureListProvinsi = _getProvinsi();
    futureListKota = _getKota(dataInput["uid_provinsi"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {Navigator.of(context).pop();},),
        elevation: 0,
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              buildHeader(),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        buildInput("Email", buildTextFormField("Email", "email")),
                        buildInput("Nomor Telepon",
                          buildTextFormField(
                            "Nomor Telepon",
                            "no_telp",
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
                          )
                        ),
                        buildInput("Password",
                          buildTextFormField(
                            "Password", "password",
                            obscureText: _obscureText,
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
                          )
                        ),
                        buildInput("Nomor Induk Kependudukan", buildTextFormField("NIK", "nik")),
                        buildInput("Nama Lengkap", buildTextFormField("Nama", "nama_lengkap")),
                        buildInput("Jenis Kelamin",
                          SelectionBoxes(
                            options: ["Laki-laki", "Perempuan"],
                            onOptionSelected: ((jenis_kelamin_value) {
                              dataInput["jenis_kelamin"] =
                                  (jenis_kelamin_value == 0 ? 'Laki-laki' : 'Perempuan');
                            }),
                          )
                        ),
                        buildInput("Tempat, Tanggal Lahir",
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              buildFutureSelection<Provinsi>(
                                futureListData: futureListProvinsi,
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<Provinsi>> snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    return DropdownButton<int>(
                                      value: indexProvinsi,
                                      icon: Icon(Icons.arrow_drop_down, color: normalWhite,),
                                      iconSize: 24,
                                      elevation: 16,
                                      style: getDefaultTextStyle(font_color: normalWhite, font_weight: FontWeight.w600),
                                      onChanged: (newValue) {
                                        setState(() {
                                          if (indexProvinsi != newValue) {
                                            indexProvinsi = newValue!;
                                            dataInput["uid_provinsi"] = listProvinsi[indexProvinsi].uidProvinsi;
                                            futureListKota = _getKota(dataInput["uid_provinsi"]);
                                          }
                                        });
                                      },
                                      items: snapshot.data!
                                          .asMap()
                                          .entries
                                          .map<DropdownMenuItem<int>>((entry) {
                                        int index = entry.key;
                                        Provinsi provinsi = entry.value;
                                        return DropdownMenuItem<int>(
                                          value: index,
                                          child: Text(
                                            provinsi.nama,
                                            style: TextStyle(
                                              color: indexProvinsi == index
                                                  ? normalWhite
                                                  : defBlue,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    );
                                  }
                                },
                              ),
                              buildFutureSelection(
                                futureListData: futureListKota,
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
                                          dataInput["uid_kota"] = listKota[indexKota].uidKota;
                                        });
                                      },
                                      items: snapshot.data!
                                          .asMap()
                                          .entries
                                          .map<DropdownMenuItem<int>>((entry) {
                                        int index = entry.key;
                                        Kota kota = entry.value;
                                        return DropdownMenuItem<int>(
                                          value: index,
                                          child: Text(
                                            kota.namaKota,
                                            style: TextStyle(
                                              color: indexKota == index
                                                  ? normalWhite
                                                  : defBlue,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    );
                                  }
                                }
                              ),
                              Row(
                                children: [
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
                                      child: buildTextFormField("Tanggal Lahir", "tanggal_lahir", textEditingController: _dateController, enabled: false)
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),

                        buildInput("BPJS",
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
                        ),
                        buildInput("Nomor BPJS", buildTextFormField("No. BPJS", "no_bpjs")),

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
                              "Tekan Jika Tidak Mempunyai BPJS",
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
                                "Daftar",
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            width: 60, // Adjust the width of the image
            height: 58, // Adjust the height of the image
            child: Image.asset("assets/img/Logo.png"),
          ),
        ),
        Center(
          child: Text(
            "Registrasi",
            style: getDefaultTextStyle(
              font_size: 24,
              font_weight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Column buildFutureSelection<Model>({
    required Future<List<Model>> futureListData,
    required Widget Function(BuildContext, AsyncSnapshot<List<Model>>) builder
    }) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: defBlue,
            borderRadius: BorderRadius.circular(22.7),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: DropdownButtonHideUnderline(
              child: FutureBuilder<List<Model>>(
                future: futureListData,
                builder: builder
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Column buildInput(String label, Widget inputField) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            label,
            style: getDefaultTextStyle(font_weight: FontWeight.w600),
          ),
        ),
        inputField
      ],
    );
  }

  Container buildTextFormField(
    String label,
    String form_key,
    {Widget ?prefixIcon,
    bool obscureText = false,
    Widget? suffixIcon,
    TextEditingController? textEditingController,
    bool enabled = true,
    }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: blackColor)),
      ),
      child: TextFormField(
        controller: textEditingController,
        obscureText: obscureText,
        enabled: enabled,
        style: getDefaultTextStyle(),
        decoration: InputDecoration(
          border: InputBorder.none, hintText: "Masukkan " + label, prefixIcon: prefixIcon, suffixIcon: suffixIcon),
        validator: (value) {
          if (value!.isEmpty) return label + ' wajib diisi!';
          dataInput[form_key] = value;
          return null;
        },
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
    var data = {
      'name': dataInput["nama_lengkap"],
      'email': dataInput["email"],
      'password': dataInput["password"],
      'nik': dataInput["nik"],
      'jenkel': dataInput["jenis_kelamin"],
      'tgl_lahir': dataInput["tanggal_lahir"],
      'tempat_lahir': dataInput["uid_kota"],
      'no_telp': dataInput["no_telp"],
    };

    var res = await Network().postData(data, 'register');

    if (res is String) {
      _showMsg(res);
    } else {
      var body = json.decode(res.body);
      if (body.containsKey('success')) {
        if (body['success']) {
          Navigator.pop(context);
        } else {
          print(body['data']);
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
    var res = await Network().getData(
        {}, 'masterdata/list-kota?uid_provinsi=' + uidProvinsi.toString());
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
        dataInput["uid_kota"] = listKota[0].kodeKota;
        print("uid kota saat ini" + dataInput["uid_kota"].toString());
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