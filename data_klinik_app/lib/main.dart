//Bella Azka Oktavia (15220775)

// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:data_klinik_app/ui/beranda.dart';
import 'package:data_klinik_app/ui/login.dart';
import 'package:data_klinik_app/helpers/user_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  print(token);
  runApp(MaterialApp(
    title: "Klinik App",
    debugShowCheckedModeBanner: false,
    home: token == null ? Login() : Beranda(),
  ));
}
