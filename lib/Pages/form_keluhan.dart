import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:tubes/Model/pasien.dart';
import 'package:tubes/Services/network.dart';
import 'package:tubes/Widget/custom_app_bar.dart';
import 'package:tubes/Widget/hashtag_gejala.dart';
import 'package:tubes/global_var.dart';
import 'package:tubes/theme.dart';

class FormKeluhan extends StatefulWidget {
  const FormKeluhan({super.key});

  @override
  State<FormKeluhan> createState() => _FormKeluhanState();
}

class _FormKeluhanState extends State<FormKeluhan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(),
      ),
      body: FormKeluhanContent(),
    );
  }
}

class FormKeluhanContent extends StatefulWidget {
  const FormKeluhanContent({super.key});

  @override
  _FormKeluhanContentState createState() => _FormKeluhanContentState();
}

class _FormKeluhanContentState extends State<FormKeluhanContent> {
  bool useBPJS = false;
  bool is_load_keluarga = true;
  final List<Pasien> itemKeluarga = [authUser!.detailPasien];
  TextEditingController keluhanController = TextEditingController();
  int selectedPatient = authUser!.detailPasien.id_profile;
  String keluhan = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAnggotaKeluarga();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Buat Janji",
            style: getDefaultTextStyle(font_size: 25),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: 20), // Menambahkan padding di bagian bawah
            child: Text(
              "Silahkan isi form untuk membuat janji temu dengan dokter",
              style: getDefaultTextStyle(),
            ),
          ),
          SizedBox(height: 20), // Menambahkan jarak vertikal
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  30), // Mengatur pinggiran menjadi rounded
              color: Color(0xFF54d4da), // Mengatur warna latar belakang box
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 20), // Memberikan padding di dalam box
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Siapa yang sakit?",
                  style: getDefaultTextStyle(
                      font_color: Colors.white, font_size: 14),
                ),
                DropdownButton<int>(
                  // Callback ketika nilai dropdown berubah
                  onChanged: (newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedPatient = newValue;
                      });
                    }
                  },
                  items: itemKeluarga.map((item) {
                    return DropdownMenuItem<int>(
                      value: item.id_profile,
                      child: Text(item.name,
                          style: getDefaultTextStyle(
                            font_color: Colors.white,
                            font_size: 14,
                          )),
                    );
                  }).toList(),
                  // Nilai awal dropdown
                  value: selectedPatient, // Nilai default
                  dropdownColor: Color(0xFF54d4da),
                ),
              ],
            ),
          ),
          SizedBox(height: 20), // Menambahkan jarak vertikal
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  30), // Mengatur pinggiran menjadi rounded
              color: Color(0xFF54d4da), // Mengatur warna latar belakang box
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: 3), // Memberikan padding di dalam box
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Gunakan BPJS",
                  style: getDefaultTextStyle(
                      font_size: 14, font_color: Colors.white),
                ),
                Row(
                  children: [
                    Text(
                      useBPJS
                          ? 'Ya'
                          : 'Tidak', // Menampilkan "Ya" jika toggle aktif, dan "Tidak" jika tidak aktif
                      style: getDefaultTextStyle(
                          font_size: 14, font_color: Colors.white),
                    ),
                    Switch(
                      value: useBPJS,
                      onChanged: (newValue) {
                        print(newValue);
                        if (newValue == true) {
                          if (authUser!.detailPasien.file_bpjs == null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Silahkan upload file bpjs terlebih dahulu pada laman profile!"),
                              backgroundColor: statusRed,
                            ));
                          } else {
                            setState(() {
                              useBPJS = newValue;
                            });
                          }
                        } else {
                          setState(() {
                            useBPJS = newValue;
                          });
                        }
                      },
                      activeColor:
                          Color(0xFFF8C952), // Mengubah warna toggle saat aktif
                      activeTrackColor:
                          Colors.white, // Warna latar belakang saat aktif
                      inactiveTrackColor:
                          Colors.white, // Warna latar belakang saat tidak aktif
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20), // Menambahkan jarak vertikal
          TextFormField(
            controller: keluhanController,
            decoration: InputDecoration(
              hintText: 'Masukkan gejala...',
              hintStyle: getDefaultTextStyle(
                  font_size: 13,
                  font_color: const Color.fromARGB(255, 155, 155, 155)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    20), // Atur radius sesuai kebutuhan Anda
              ),
            ),
            style: getDefaultTextStyle(font_size: 13),
            maxLines: 9,
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              _sendForm();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Color(0xFF54d4da), // Gunakan warna primer dari tema aplikasi
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20), // Atur padding tombol
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(25)), // Bentuk pinggiran tombol
            ),
            child: Container(
              width: MediaQuery.of(context).size.width *
                  0.8, // Lebar tombol 80% dari lebar layar
              child: Center(
                child: Text(
                  'Buat Janji',
                  style: getDefaultTextStyle(
                      font_color: Colors.white,
                      font_size: 18), // Gaya teks tombol
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getAnggotaKeluarga() async {
    var data = {
      'user_id': authUser!.id.toString(),
      'is_keluarga': true.toString()
    };
    var res = await Network().getData(data, 'masterdata/list-pasien-keluarga');
    var body = json.decode(res.body);
    print(body);
    if (body.containsKey('success')) {
      if (body["success"]) {
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(body['message']),
          backgroundColor: statusRed,
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Unknown server error"),
        backgroundColor: statusRed,
      ));
    }
  }

  _sendForm() {
    print("use bpjs : " + useBPJS.toString());
    print("pasien id : " + selectedPatient.toString());
    print("keluhan : " + keluhanController.text);
  }
}
