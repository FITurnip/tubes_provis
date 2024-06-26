import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tubes/Model/pasien.dart';
import 'package:tubes/Model/user.dart';
import 'package:tubes/Services/network.dart';
import 'package:tubes/Widget/bottom_nav.dart';
import 'package:tubes/global_var.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Pages/Auth/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: normalWhite),
        child: Stack(
          children: <Widget>[
            Header(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                child: Container(
                    decoration: BoxDecoration(
                      color: defBlue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    child: InputWrapper()),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Center(
            child: SizedBox(
              height: 100,
              child: Image.asset("assets/img/Logo.png"),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            my_app_name,
            style: getDefaultTextStyle(
              font_size: 20,
              font_color: basicYellow,
            ),
          ),
          Text(
            "Sistem Informasi Rawat Jalan",
            style: getDefaultTextStyle(font_color: basicYellow),
          ),
          SizedBox(
            height: 40,
          )
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
  Map<String, dynamic> dataInput = {};
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
              SizedBox(
                height: 20,
              ),
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
              buildInput(
                  label: "Email",
                  visibilityButton: false,
                  dataInputKey: "email"),
              buildInput(
                  label: "Password",
                  visibilityButton: false,
                  obscureText: _secureText,
                  dataInputKey: "password"),
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
                  if (_formKey.currentState!.validate() && !_isLoading) {
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
                            RegisterPage()), // Ganti dengan RegisterPage1 jika diperlukan
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

  Column buildInput(
      {required String label,
      required bool visibilityButton,
      bool obscureText = false,
      required String dataInputKey}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          label,
          style: getDefaultTextStyle(
            font_color: normalWhite,
          ),
        ),
        TextFormField(
          cursorColor: Colors.white,
          keyboardType: TextInputType.text,
          obscureText: obscureText,
          style: getDefaultTextStyle(font_color: normalWhite),
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: normalWhite),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: normalWhite),
              ),
              suffixIcon: (visibilityButton
                  ? IconButton(
                      onPressed: showHide,
                      icon: Icon(
                        _secureText ? Icons.visibility_off : Icons.visibility,
                        color: normalWhite,
                      ),
                    )
                  : null)),
          validator: (value) {
            if (value!.isEmpty) return dataInputKey + ' wajib diisi!';
            dataInput[dataInputKey] = value;
            // print(dataInput[dataInputKey]);
            return null;
          },
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _login() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
      var data = {
        'email': dataInput['email'],
        'password': dataInput['password']
      };
      var res = await Network().auth(data, 'login');
      if (res is String) {
        _showMsg(res);
      } else {
        var body = json.decode(res.body);
        if (body.containsKey('success')) {
          if (body['success']) {
            SharedPreferences localStorage =
                await SharedPreferences.getInstance();
            localStorage.setString('token', json.encode(body['data']['token']));
            localStorage.setString(
                'user', json.encode(body['data']['user_info']));
            var userInfo = body['data']['user_info'];
            Pasien detailUser = Pasien.fromJson(userInfo['detail_profile']);
            authUser = User(userInfo['id'], userInfo['name'], userInfo['email'],
                userInfo['role'], detailUser, body['data']['token']);

            Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                  builder: (context) => BottomNav(
                        selectedIndex: 0,
                      )),
            );
          } else {
            _showMsg(body['data']['error']);
          }
        } else {
          _showMsg("500 Server error");
        }
      }
    }
    setState(() {
      _isLoading = false;
    });
  }
}
