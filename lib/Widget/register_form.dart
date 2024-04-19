import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/pressable_widget.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  bool _obscureText = true;
  String dropdownValueProvinsi = 'Jawa Barat';
  String dropdownValueKota = 'Bandung';

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
                      width: 55, // Lebar kotak
                      height: 0,
                      alignment: Alignment.center, // Posisi teks di tengah
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: defBlue, // Warna kotak
                      ),
                      child: Text("+62",
                          style: getDefaultTextStyle(
                              font_size: 13,
                              font_color: normalWhite,
                              font_weight: FontWeight.w700)),
                    ),
                  ),
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
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Jenis Kelamin",
                style: getDefaultTextStyle(font_weight: FontWeight.w600),
              ),
            ),

            Row(children: [
              PressableWidget(
                  onPressed: () {},
                  child: Container(
                      padding: EdgeInsets.all(2.0),
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: defBlue,
                      ),
                      child: Container(
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
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
                        borderRadius: BorderRadius.circular(16),
                        color: basicYellow,
                      ),
                      child: Container(
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: basicYellow,
                              width: 1.0,
                            ),
                            color: basicYellow,
                          ),
                          child: Text("Perempuan",
                              style: TextStyle(color: Colors.white))))),
            ]),

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
                    borderRadius: BorderRadius.circular(22.7), // Border radius
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: dropdownValueProvinsi,
                          // isExpanded:
                          //     true, // Membuat dropdown button menyesuaikan lebar
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: normalWhite,
                          ), // Icon dropdown
                          iconSize: 24,
                          elevation: 16,
                          style: getDefaultTextStyle(
                              font_color: normalWhite,
                              font_weight: FontWeight.w600), // Warna teks
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
                    borderRadius: BorderRadius.circular(22.7), // Border radius
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: dropdownValueKota,
                          // isExpanded:
                          //     true, // Membuat dropdown button menyesuaikan lebar
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: normalWhite,
                          ), // Icon dropdown
                          iconSize: 24,
                          elevation: 16,
                          style: getDefaultTextStyle(
                              font_color: normalWhite,
                              font_weight: FontWeight.w600), // Warna teks
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
                    width: 40, // Lebar tombol
                    height: 40, // Tinggi tombol
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: defBlue, // Warna latar belakang
                      borderRadius: BorderRadius.circular(8), // Border radius
                    ),
                    child: Icon(
                      Icons.calendar_month_outlined, // Icon tanggal
                      color: Colors.white, // Warna ikon
                    ),
                  ),
                ),
                SizedBox(width: 10), // Spasi antara tombol dan TextFormField
                // TextFormField untuk menampilkan tanggal yang dipilih
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
                        hintText: 'Pilih Tanggal', // Hint text
                      ),
                      enabled:
                          false, // Tidak bisa diedit langsung oleh pengguna
                    ),
                  ),
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
                        ///////////////
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
}
