import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:tubes/Widget/custom_app_bar.dart';
import 'package:tubes/Widget/hashtag_gejala.dart';
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
  TextEditingController keluhanController = TextEditingController();
  String selectedPatient = 'Legi Kuswandi';
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
            padding: EdgeInsets.only(bottom: 20), // Menambahkan padding di bagian bawah
            child: Text(
              "Silahkan isi form untuk membuat janji",
              style: getDefaultTextStyle(),
            ),
          ),
          SizedBox(height: 20), // Menambahkan jarak vertikal
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Mengatur pinggiran menjadi rounded
              color: Color(0xFF54d4da), // Mengatur warna latar belakang box
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Memberikan padding di dalam box
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Siapa yang sakit?",
                  style: getDefaultTextStyle(font_color: Colors.white, font_size: 18),
                ),
                DropdownButton<String>(
                  // Buatlah list dari pasien yang dapat dipilih
                  items: <String>['Legi Kuswandi', 'Franklin Turnip', 'Rahman Ismail']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value.length <= 8 ? value : value.substring(0, 8) + '..', // Batasi panjang teks menjadi 12 karakter
                        overflow: TextOverflow.ellipsis, // Tambahkan elipsis (...) jika teks melebihi batas
                        maxLines: 1,
                        style: getDefaultTextStyle(font_color: Colors.white, font_size: 18), // Hanya satu baris yang ditampilkan
                      ),
                    );
                  }).toList(),
                  // Callback ketika nilai dropdown berubah
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedPatient = newValue;
                      });
                    }
                  },
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
              borderRadius: BorderRadius.circular(30), // Mengatur pinggiran menjadi rounded
              color: Color(0xFF54d4da), // Mengatur warna latar belakang box
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Memberikan padding di dalam box
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Gunakan BPJS",
                  style: getDefaultTextStyle(font_size: 18, font_color: Colors.white),
                ),
                Row(
                  children: [
                    Text(
                      useBPJS ? 'Ya' : 'Tidak', // Menampilkan "Ya" jika toggle aktif, dan "Tidak" jika tidak aktif
                      style: getDefaultTextStyle(font_size: 18, font_color: Colors.white),
                    ),
                    Switch(
                      value: useBPJS,
                      onChanged: (newValue) {
                        setState(() {
                          useBPJS = newValue;
                        });
                      },
                      activeColor: Color(0xFFF8C952), // Mengubah warna toggle saat aktif
                      activeTrackColor: Colors.white, // Warna latar belakang saat aktif
                      inactiveTrackColor: Colors.white, // Warna latar belakang saat tidak aktif
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
              hintStyle: getDefaultTextStyle(font_size: 18, font_color: const Color.fromARGB(255, 155, 155, 155)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20), // Atur radius sesuai kebutuhan Anda
              ),
            ),
            style: getDefaultTextStyle(font_size: 18),
            maxLines: 5,
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Tambahkan logika untuk menangani reservasi di sini
              // Contoh: Panggil fungsi atau tampilkan dialog konfirmasi
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF54d4da), // Gunakan warna primer dari tema aplikasi
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20), // Atur padding tombol
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)), // Bentuk pinggiran tombol
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8, // Lebar tombol 80% dari lebar layar
              child: Center(
                child: Text(
                  'Buat Janji',
                  style: getDefaultTextStyle(font_color: Colors.white, font_size: 18), // Gaya teks tombol
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
