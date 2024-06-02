import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:tubes/Controller/janji_temu_controller.dart';
import 'package:tubes/Controller/lokasi_controller.dart';
import 'package:tubes/Controller/pasien_controller.dart';
import 'package:tubes/Controller/detail_kunjungan_controller.dart';
import 'package:tubes/Services/check_auth.dart';
import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

void main() {
  initializeDateFormatting('id_ID', null).then(
    (_) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: ((context) => PasienControlProvider()),
          ),
          ChangeNotifierProvider(
            create: ((context) => JanjiTemuControlProvider()),
          ),
          ChangeNotifierProvider(
            create: ((context) => KunjunganProvider()),
          ),
          ChangeNotifierProvider(
            create: ((context) => LokasiControlProvider()),
          )
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CheckAuth(),
      debugShowCheckedModeBanner: false,
      title: my_app_name,
    );
  }
}
