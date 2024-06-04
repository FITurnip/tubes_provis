import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tubes/Controller/lokasi_controller.dart';
import 'package:tubes/Model/pasien.dart';
import 'package:tubes/Widget/selection_boxes.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Model/provinsi.dart';
import 'package:tubes/Model/kota.dart';
import 'package:tubes/Services/network.dart';

class StoreUpdateKeluarga extends StatefulWidget {
  final Pasien ?pasien;
  StoreUpdateKeluarga({this.pasien}) {
    print(pasien?.jenkel);
  }

  @override
  _StoreUpdateKeluargaState createState() => _StoreUpdateKeluargaState();
}

class _StoreUpdateKeluargaState extends State<StoreUpdateKeluarga> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController, _no_telpController, _nikController, _dateController;
  bool? isChecked = false;
  bool _isPostData = false;
  bool _isProvinsiLoading = true;
  bool _isKotaLoading = true;

  late Map<String, dynamic> dataInput;

  List<Provinsi> listProvinsi = [];
  List<Kota> listKota = [];

  Provinsi ?selectedProvinsi;
  Kota ?selectedKota;

  Future<void> fetchProvinsi() async {
    await Provider.of<LokasiControlProvider>(context, listen: false).fetchProvinsi();
    setState(() {
      final lokasiProvider = Provider.of<LokasiControlProvider>(context, listen: false);
      listProvinsi.clear();
      listProvinsi = lokasiProvider.listProvinsi;
      if (listProvinsi.isNotEmpty) {
        selectedProvinsi = listProvinsi[0];
      }
      _isProvinsiLoading = false;
    });
  }

  Future<void> fetchKota(int uid_kota) async {
    await Provider.of<LokasiControlProvider>(context, listen: false).fetchKota(uid_kota);
    setState(() {
      print("uid kota:");
      print(uid_kota);
      _isKotaLoading = true;
      final lokasiProvider = Provider.of<LokasiControlProvider>(context, listen: false);
      listKota = lokasiProvider.listKota;
      if (listKota.isNotEmpty) {
        selectedKota = listKota[0];
      }

      print("nama kota: ");
      print(selectedKota?.namaKota);
      _isKotaLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    // Initialize dataInput
    dataInput = {
      "jenis_kelamin": widget.pasien?.jenkel ?? 'Laki-laki',
      "uid_provinsi": (widget.pasien?.id_tempat_lahir ?? 6504) ~/ 100,
      "uid_kota": widget.pasien?.id_tempat_lahir ?? 6504,
    };

    fetchProvinsi();
    fetchKota(dataInput["uid_provinsi"]);

    _nameController = TextEditingController(text: widget.pasien?.name ?? '');
    _no_telpController = TextEditingController(text: widget.pasien?.no_telp ?? '');
    _nikController = TextEditingController(text: widget.pasien?.nik ?? '');
    _dateController = TextEditingController(text: widget.pasien?.tgl_lahir != null ? DateFormat('yyyy-MM-dd').format(widget.pasien!.tgl_lahir) : null);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildInput("Nama Lengkap", buildTextFormField("Nama", "name", textEditingController: _nameController)),
            buildInput("Nomor Telepon",
              buildTextFormField(
                "Nomor Telepon",
                "no_telp",
                textEditingController: _no_telpController,
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
            buildInput("Nomor Induk Kependudukan", buildTextFormField("NIK", "nik", textEditingController: _nikController)),
            buildInput("Jenis Kelamin",
              SelectionBoxes(
                options: ["Laki-laki", "Perempuan"],
                onOptionSelected: ((jenis_kelamin_value) {
                  dataInput["jenis_kelamin"] =
                      (jenis_kelamin_value == 0 ? 'Laki-laki' : 'Perempuan');
                }),
                defaultSelectedId: (dataInput["jenis_kelamin"] == "Laki-laki" ? 0 : 1),
              )
            ),
            buildInput("Tempat, Tanggal Lahir",
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      if(_isProvinsiLoading) CircularProgressIndicator(),
                      if(!_isProvinsiLoading) Container(
                        decoration: BoxDecoration(
                          color: defBlue,
                          borderRadius: BorderRadius.circular(22.7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<Provinsi>(
                              value: selectedProvinsi,
                              icon: Icon(Icons.arrow_drop_down, color: normalWhite,),
                              iconSize: 24,
                              elevation: 16,
                              style: getDefaultTextStyle(font_color: normalWhite, font_weight: FontWeight.w600),
                              onChanged: (newValue) async {
                                bool isSameValue = true;
                                setState(() {
                                  if (newValue != null && selectedProvinsi != newValue) {
                                    isSameValue = false;
                                    selectedProvinsi = newValue;
                                    dataInput["uid_provinsi"] = newValue.uidProvinsi;
                                    print(dataInput["uid_provinsi"]);
                                  }
                                });
                                if(!isSameValue) await fetchKota(dataInput["uid_provinsi"]);
                              },
                              items: listProvinsi.map((Provinsi provinsi) {
                                return DropdownMenuItem(
                                  value: provinsi,
                                  child: Text(
                                    provinsi.nama,
                                    style: TextStyle(
                                      shadows: selectedProvinsi == provinsi ? [
                                        Shadow(
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 5.0,
                                          color: defBlue,
                                        ),
                                      ] : [],
                                      color: selectedProvinsi == provinsi ? normalWhite : defBlue,
                                    )),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      if(_isKotaLoading) CircularProgressIndicator(),
                      if(!_isKotaLoading) Container(
                        decoration: BoxDecoration(
                          color: defBlue,
                          borderRadius: BorderRadius.circular(22.7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<Kota>(
                              value: selectedKota,
                              icon: Icon(Icons.arrow_drop_down, color: normalWhite,),
                              iconSize: 24,
                              elevation: 16,
                              style: getDefaultTextStyle(font_color: normalWhite, font_weight: FontWeight.w600),
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    selectedKota = newValue;
                                    dataInput["uid_kota"] = newValue.uidKota;
                                    print(selectedKota!.namaKota);
                                  }
                                });
                              },
                              items: listKota.map((Kota kota) {
                                return DropdownMenuItem(
                                  value: kota,
                                  child: Text(
                                    kota.namaKota,
                                    style: TextStyle(
                                      shadows: selectedKota == kota ? [
                                        Shadow(
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 5.0,
                                          color: defBlue,
                                        ),
                                      ] : [],
                                      color: selectedKota == kota ? normalWhite : defBlue,
                                    )),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
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
                        _createUpdateKeluarga();
                      });
                    }
                  },
                  child: _isPostData
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Text(
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

  void _createUpdateKeluarga() async {
    _isPostData = true;
    var data = {
      if(widget.pasien != null) 'profile_id' : widget.pasien?.id_profile,
      'name': dataInput["name"],
      'email': '',
      'nik': dataInput["nik"],
      'jenkel': dataInput["jenis_kelamin"],
      'tgl_lahir': dataInput["tanggal_lahir"],
      'tempat_lahir': dataInput["uid_kota"],
      'no_telp': dataInput["no_telp"],
    };

    print(data);
    var res = await Network().postData(data, 'profile/storeUpdate');

    if (res is String) {
      _showMsg(res);
    } else {
      var body = json.decode(res.body);
      print(body);
      if (body.containsKey('success')) {
        Navigator.pop(context);
      } else {
        _showMsg('500 Server Error');
      }
    }
    _isPostData = false;
  }
}
