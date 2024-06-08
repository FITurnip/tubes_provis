import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes/Model/pasien.dart';
import 'package:tubes/Model/user.dart';
import 'package:tubes/Pages/Auth/login_page.dart';
import 'package:tubes/Widget/bottom_nav.dart';
import 'package:tubes/global_var.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    dynamic token = localStorage.getString('token');
    if (token != null) {
      if (mounted) {
        setState(() {
          isAuth = true;
        });
      }
      dynamic userInfo = localStorage.getString('user');
      userInfo = jsonDecode(userInfo);
      Pasien detailUser = Pasien.fromJson(userInfo['detail_profile']);
      authUser = User(userInfo['id'], userInfo['name'], userInfo['email'],
          userInfo['role'], detailUser, token);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = BottomNav(
        selectedIndex: 0,
      );
    } else {
      child = LoginPage();
    }

    return Scaffold(
      body: child,
    );
  }
}
