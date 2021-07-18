import 'package:flutter/material.dart';
import 'package:test_one/information.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'login_page.dart';
import './signup_page.dart';
import './home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      title: 'Login-COER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
      routes: <String, WidgetBuilder>{
        //'/landingpage' : (BuildContext context)=> MyApp(),

        '/login': (BuildContext context) => LoginPage(),
        '/signup': (BuildContext context) => SignupPage(),
        '/homePage': (BuildContext context) => HomePage(),
        '/information': (BuildContext context) => Information()
      },
    );
  }
}
