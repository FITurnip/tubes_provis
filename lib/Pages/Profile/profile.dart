import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes/Pages/Auth/login_page.dart';
import 'package:tubes/Pages/Profile/list_keluarga.dart';
import 'package:tubes/Services/network.dart';
import 'package:tubes/Widget/notifcation_dialog.dart';
import 'package:tubes/Widget/selection_boxes.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/rounded_image.dart';

// enum gender { pria, wanita }

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _nomorBpjs = "";
  // gender? genderSelected;
  String? _selectedOption;
  String labelText = "Email";
  var email, name;
  bool _isLoading = false;
  var jenis_kelamin = 'Laki-laki';
  late double mediaWidth;

  @override
  Widget build(BuildContext context) {
    mediaWidth = MediaQuery.of(context).size.width - (defaultEdgeInsetScreen * 3);
    return Container(
      padding: getDefaultPaddingScreen(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        _showImagePickerOptions(); // Panggil fungsi untuk menampilkan pilihan galeri atau kamera
                      },
                      child: Stack(
                        children: [
                          RoundedImage(
                            imagePath: 'assets/img/photo_profile.png',
                            size: mediaWidth / 4,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 3 * mediaWidth / 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Samdysara Saragih",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                        Text(
                          DateFormat("d MMMM y", "id_ID").format(
                            DateTime.parse('2024-01-08 09:45:00'),
                          ),
                          overflow: TextOverflow.clip,
                        ),
                        Text(
                          "samdysara@gmail.com",
                          style: getDefaultTextStyle(
                            font_color: blackColor,
                          ),
                        ),
                      ],
                    ),
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
                          _showImagePickerOptions();
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
                          'Unggah File BPJS',
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
              FormInput(
                label: "Jenis Kelamin",
                widget: SelectionBoxes(
                  options: ["Laki-laki", "Perempuan"],
                  onOptionSelected: ((jenis_kelamin_value) {
                    jenis_kelamin =
                        (jenis_kelamin_value == 0 ? 'Laki-laki' : 'Perempuan');
                  }),
                ),
              ),
              FormInput(
                  label: "Nomor Telepon",
                  widget: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Masukkan Nomor Telepon",
                    ),
                  )),
              // FormInput(
              //     label: "Kata Sandi",
              //     widget: TextFormField(
              //       obscureText: true,
              //       decoration: InputDecoration(
              //         hintText: "Masukkan Kata Sandi",
              //       ),
              //     )),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>ListKeluarga()),
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
                    'Daftar Anggota Keluarga',
                    style: TextStyle(
                      color: Colors.white, // Warna teks putih
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // styling aja buttonnya bang
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => NotifcationDialog(
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text("Anda yakin ingin keluar?", style: getDefaultTextStyle(font_size: 15.0, font_weight: FontWeight.bold, font_color: normalWhite)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(onPressed: () => logout(context), child: Text("Yakin", style: getDefaultTextStyle(),)),
                              ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("Batalkan", style: getDefaultTextStyle())),
                            ],
                          )
                        ],
                      )
                    )
                  );
                },
                child: Text('Log out', style: getDefaultTextStyle()),
              )
            ],
          ),
        ),
      ),
    );
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void logout(BuildContext context) async {
    var data = {};
    var res = await Network().postData(data, 'logout');
    print("proses 1");
    if (res is String) {
      _showMsg(res);
    } else {
      var body = json.decode(res.body);
      print("proses 2");
      if (body.containsKey('data')) {
        if(body['data']) {
          Network().removeToken();
          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginPage())));
        } else {
          print("Failed to logout");
        }
      } else {
        print("Failed to logout");
      }
    }
  }


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

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Galeri'),
                onTap: () {
                  _getImageFromGallery();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Kamera'),
                onTap: () {
                  _getImageFromCamera();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Jika pengguna berhasil memilih gambar dari galeri
      String imagePath = pickedFile.path;
      // Tambahkan logika untuk mengganti foto profil dengan imagePath yang dipilih
    } else {
      // Jika pengguna tidak memilih gambar
      print('Tidak ada gambar yang dipilih.');
    }
  }

  void _getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Jika pengguna berhasil mengambil gambar dari kamera
      String imagePath = pickedFile.path;
      // Tambahkan logika untuk mengganti foto profil dengan imagePath yang dipilih
    } else {
      print('Tidak ada gambar yang diambil.');
    }
  }
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
// class SelectionBox extends StatelessWidget {
//   double borderRadius = 10.0;
//   @override
//   Widget build(BuildContext context) {
//     return Row(children: [
//       PressableWidget(
//           onPressed: () {},
//           child: Container(
//               padding: EdgeInsets.all(2.0),
//               margin: EdgeInsets.symmetric(vertical: 8.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(borderRadius),
//                 color: defBlue,
//               ),
//               child: Container(
//                   padding: EdgeInsets.all(6.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(borderRadius),
//                     border: Border.all(
//                       color: Colors.white,
//                       width: 1.0,
//                     ),
//                     color: defBlue,
//                   ),
//                   child: Text("Laki-laki",
//                       style: TextStyle(color: Colors.white))))),
//       SizedBox(width: 10),
//       PressableWidget(
//           onPressed: () {},
//           child: Container(
//               padding: EdgeInsets.all(2.0),
//               margin: EdgeInsets.symmetric(vertical: 8.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(borderRadius),
//                 color: basicYellow,
//               ),
//               child: Container(
//                   padding: EdgeInsets.all(6.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(borderRadius),
//                     border: Border.all(
//                       color: basicYellow,
//                       width: 1.0,
//                     ),
//                     color: basicYellow,
//                   ),
//                   child: Text("Perempuan",
//                       style: TextStyle(color: Colors.white))))),
//     ]);
//   }
// }
