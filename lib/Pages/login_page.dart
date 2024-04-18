import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tubes/Services/network.dart';
import 'package:tubes/Widget/bottom_nav.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Pages/registerpage1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: normalWhite),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Header(),
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                    color: defBlue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: InputWrapper(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: SizedBox(
              width: 130, // Atur lebar gambar
              height: 300, // Atur tinggi gambar
              child: Image.asset("assets/img/Logo.png"),
            ),
          ),
        ],
      ),
    );
  }
}

class InputWrapper extends StatefulWidget {
  @override
  _InputWrapperState createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  String labelText = 'Email';
  var email, pw;
  bool _secureText = true;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(
                      color: normalWhite,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Email",
                    style: getDefaultTextStyle(
                      font_color: normalWhite,
                    ),
                  ),
                  TextFormField(
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    style: getDefaultTextStyle(font_color: normalWhite),
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: normalWhite),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: normalWhite))),
                    validator: (emailvalue) {
                      if (emailvalue!.isEmpty) {
                        return 'Email wajib diisi!';
                      }
                      email = emailvalue;
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Password",
                    style: getDefaultTextStyle(
                      font_color: normalWhite,
                    ),
                  ),
                  TextFormField(
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    obscureText: _secureText,
                    style: getDefaultTextStyle(font_color: normalWhite),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: normalWhite),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: normalWhite),
                      ),
                      suffixIcon: IconButton(
                        onPressed: showHide,
                        icon: Icon(
                          _secureText ? Icons.visibility_off : Icons.visibility,
                          color: normalWhite,
                        ),
                      ),
                    ),
                    validator: (pwvalue) {
                      if (pwvalue!.isEmpty) {
                        return 'Password wajib diisi!';
                      }
                      pw = pwvalue;
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: defBlue,
                  backgroundColor: normalWhite, // Warna latar belakang tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                    side: BorderSide(color: defBlue),
                  ),
                  minimumSize: Size(160, 34), // Ukuran minimum tombol
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login();
                  }
                },
                child: Text(
                  _isLoading ? 'Loading..' : 'Masuk',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Belum Punya Akun?",
                style: TextStyle(
                  color: normalWhite,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    // Gunakan Navigator.push untuk merute ke halaman RegisterPage1
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Register()), // Ganti dengan RegisterPage1 jika diperlukan
                  );
                },
                child: Text(
                  "Daftar",
                  style: TextStyle(
                    color: normalWhite,
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.combine([
                      TextDecoration.underline,
                    ]),
                    decorationColor: Colors.white,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {'email': email, 'password': pw};
    var res = await Network().auth(data, 'login');
    var body = json.decode(res.body);
    print(body);
    // if (body['success']) {
    //   SharedPreferences localStorage = await SharedPreferences.getInstance();
    //   localStorage.setString('token', json.encode(body['token']));
    //   localStorage.setString('user', json.encode(body['user']));
    //   Navigator.pushReplacement(
    //     context,
    //     new MaterialPageRoute(
    //         builder: (context) => BottomNav(
    //               selectedIndex: 0,
    //             )),
    //   );
    // } else {
    //   print(body);
    // }

    setState(() {
      _isLoading = false;
    });
  }
}
