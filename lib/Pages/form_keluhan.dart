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

//Bikin di sini dulu ajalah wkwkwkwk
List<String> gejalaList = [
  "#Mual",
  "#ISPA",
  "#SakitGigi",
  "#Muntah",
  "#SakitKepala",
  "#Pendarahan",
  //Contoh hashtags
];

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hai, Hafiizh",
            style: getDefaultTextStyle(font_size: 25),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20), // Menambahkan padding di bagian bawah
            child: Text(
              "Selamat datang kembali di aplikasi SIRAJA!",
              style: getDefaultTextStyle(),
            ),
          ),
          Text(
            "Buat reservasi rawat jalan!",
            style: getDefaultTextStyle(font_size: 20),
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
                      style: getDefaultTextStyle(font_size: 15, font_color: Colors.white),
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
              hintText: 'Masukkan keluhan...', // Mengatur teks yang akan hilang saat masukan dimulai
              hintStyle: getDefaultTextStyle(font_size: 18, font_color: const Color.fromARGB(255, 155, 155, 155)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20), // Atur radius sesuai kebutuhan Anda
              ),
            ),
            style: getDefaultTextStyle(font_size: 18),
            maxLines: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0), // Tambahkan padding bawah ke teks "Gejala"
            child: Row(
              children: [
                Text(
                  "Gejala",
                  style: getDefaultTextStyle(font_size: 18, font_color: blackColor),
                ),
                SizedBox(width: 10), // Tambahkan jarak horizontal antara teks dan ikon
                Icon(
                  Icons.search, // Gunakan ikon kaca pencarian
                  color: blackColor, // Sesuaikan warna ikon
                  size: 24, // Sesuaikan ukuran ikon
                ),
              ],
            ),
          ),
          SizedBox(height: 10), // Menambahkan jarak vertikal
          Padding(
            padding: EdgeInsets.only(bottom: 20), // Tambahkan padding di bagian bawah tombol
            child: Wrap(
              alignment: WrapAlignment.start, // Meratakan widget ke kiri
              children: List.generate(
                gejalaList.length, // Menggunakan panjang list gejala sebagai batas iterasi
                (index) => Padding(
                  padding: EdgeInsets.only(right: 5.0, bottom: 5.0), // Atur padding kanan dan bawah
                  child: HashtagGejala(
                    label: gejalaList[index], // Menggunakan label dari gejalaList
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Tambahkan logika untuk menangani reservasi di sini
              // Contoh: Panggil fungsi atau tampilkan dialog konfirmasi
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF54d4da), // Gunakan warna primer dari tema aplikasi
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Atur padding tombol
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // Bentuk pinggiran tombol
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8, // Lebar tombol 80% dari lebar layar
              child: Center(
                child: Text(
                  'Reservasi',
                  style: TextStyle(fontSize: 18, color: Colors.white), // Gaya teks tombol
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Tambahkan logika untuk menangani reservasi di sini
              // Contoh: Panggil fungsi atau tampilkan dialog konfirmasi
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF54d4da), // Gunakan warna primer dari tema aplikasi
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Atur padding tombol
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // Bentuk pinggiran tombol
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8, // Lebar tombol 80% dari lebar layar
              child: Center(
                child: Text(
                  'Rekomendasi Dokter',
                  style: TextStyle(fontSize: 18, color: Colors.white), // Gaya teks tombol
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
