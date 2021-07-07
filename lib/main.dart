import 'package:flutter/material.dart';
import 'package:test_one/admin/main.dart';
import 'package:test_one/information.dart';
import 'login_page.dart';
import './signup_page.dart';
import './home_page.dart';
import './splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login-COER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
      routes: <String,WidgetBuilder>{
        '/landingpage' : (BuildContext context)=> MyApp(),
        '/adminLogin' : (BuildContext context)=> AdminApp(),
        '/login' : (BuildContext context)=> LoginPage(),
        '/signup' : (BuildContext context)=> SignupPage(),
        '/homePage' : (BuildContext context)=> HomePage(),
        '/splash' : (BuildContext context)=> SplashPage(),
        '/information' : (BuildContext context)=> Information()
      },
    );
  }
}
