import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes/Widget/selection_boxes.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/pressable_widget.dart';

class tambahkeluarga extends StatefulWidget {
  @override
  _tambahkeluargaState createState() => _tambahkeluargaState();
}

class _tambahkeluargaState extends State<tambahkeluarga> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  bool _obscureText = true;
  bool? isChecked = false;
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
                "Nama Lengkap Anggota Keluarga",
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
                    hintText: "Masukkan Nama Lengkap Anggota Keluarga"),
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
                "Foto Anggota Keluarga",
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
                        "Unggah Foto Anggota Keluarga",
                        style: getDefaultTextStyle(font_color: defBlue),
                      ),
                    ],
                  ),
                ),
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

            SelectionBoxes(
              options: ["Laki-laki", "Perempuan"],
              onOptionSelected: ((p0) {
                print(p0);
              }),
            ),

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
                        //buat tombol simpan daftar
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
