import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cobaa/componets/bottomnavbar.dart';
import 'package:cobaa/pages/detailproduk.dart';
import 'package:cobaa/pages/editFoto.dart';
import 'package:cobaa/pages/gmaps.dart';
import 'package:cobaa/pages/editProfil.dart';
import 'package:cobaa/pages/jual.dart';
import 'package:cobaa/pages/profil.dart';
import 'package:cobaa/pages/register.dart';
import 'pages/beli.dart';
import 'pages/home.dart';
import 'pages/login.dart';
import 'pages/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: Color.fromRGBO(41, 171, 5, 1)),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Color.fromRGBO(41, 171, 5, 1),
        secondary: Color.fromRGBO(1, 68, 36, 1),
      )),
      initialRoute: './',
      routes: {
        '/splash': (context) => Splash(),
        '/home': (context) => Home(username: username),
        '/profil': (context) => Profil(username: username),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/bottomnavbar': (context) => Bottomnavbar(username: username),
        '/beli': (context) => Beli(),
        '/detailProduk': (context) => Detailproduk(),
        '/editProfil': (context) => EditProfil(),
        '/editfotoprofil': (context) => EditFoto(),
        '/gmaps': (context) => Gmaps(),
        '/jual': (context) => JualProduk(),
      },
      home: Splash(),
    );
  }
}
