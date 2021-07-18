import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_one/login_page.dart';
import 'package:test_one/widget/becontainer.dart';

import 'home_page.dart';
import 'networkHandler.dart';

class Information extends StatefulWidget {
  Information({Key key, this.title, this.password}) : super(key: key);

  final String title;
  final String password;

  @override
  _InformationState createState() => _InformationState();
}

Map<String, String> info = {};

class _InformationState extends State<Information> {
  bool duplicates = false, check = true;
  NetworkHandler networkHandler = NetworkHandler();

  /* Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }*/

  Widget _entryField(String title, {bool isPassword = false}) {
    String str = "";
    switch (title) {
      case 'FullName':
        str = "name";
        break;
      case 'USN':
        str = "usn";
        break;
      case 'Registration Number':
        str = "reg_no";
        break;
      case 'Semester':
        str = "sem";
        break;
      case 'Hostel Name':
        str = "hostel";
        break;
      case 'Room Number':
        str = "room_no";
        break;
      case 'Phone Number':
        str = "phoneNumber";
        break;
      case 'Email ID':
        str = "email";
        break;
      case 'Mother`s Contact No.':
        str = "Mphone";
        break;
      case 'Father`s Contact No.':
        str = "Fphone";
        break;
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              onChanged: (value) {
                setState(() {
                  info[str.replaceAll(" ", "").replaceAll("'s", "")] = value;
                });
                print(info);
              },
              style: TextStyle(color: Colors.white),
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  fillColor: Color(0xff247BA0),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 65.0,
        child: FloatingActionButton(
          onPressed: () async {
            info["password"] = "${widget.password}";

            // check for duplicate reg_no
            EasyLoading.show(status: 'Loading..');
            var response =
                await networkHandler.get("/checkreg_no/:${info["reg_no"]}");
            EasyLoading.dismiss();
            if (response['Status']) {
              duplicates = true;
              EasyLoading.showInfo(
                  "Registration no. already exists \n Please go to login");
            } else {
              duplicates = false;
            }

            //check for duplicate usn
            EasyLoading.show(status: 'Loading..');
            response = await networkHandler.get("/checkusn/:${info["usn"]}");
            EasyLoading.dismiss();
            if (response['Status']) {
              duplicates = true;

              EasyLoading.showInfo(
                  "USN already registered \n Please go to login");
            } else {
              duplicates = false;
            }

            //check for duplicate email
            EasyLoading.show(status: 'Loading..');
            response =
                await networkHandler.get("/checkemail/:${info["email"]}");
            EasyLoading.dismiss();
            if (response['Status']) {
              duplicates = true;

              EasyLoading.showInfo(
                  "email already registered \n Please go to login");
            } else {
              duplicates = false;
            }

            //check for duplicate phone Number
            EasyLoading.show(status: 'Loading..');
            response = await networkHandler
                .get("/checkphoneNumber/:${info["phoneNumber"]}");
            EasyLoading.dismiss();
            if (response['Status']) {
              duplicates = true;

              EasyLoading.showInfo(
                  "phoneNumber already registered \n Please go to login");
            } else {
              duplicates = false;
            }
            //duplicates = false;
            if (duplicates == false && check == true) {
              EasyLoading.show(status: 'Loading..');
              print(info);
              var responseRegister =
                  await networkHandler.post("/register", info);
              EasyLoading.dismiss();

              if (responseRegister.statusCode == 200 ||
                  responseRegister.statusCode == 201) {
                print("Success!");
                EasyLoading.showInfo("Student Registered succesfully!");
                EasyLoading.show(status: 'Redirecting to Login');

                Future.delayed(Duration(milliseconds: 300), () {
                  EasyLoading.dismiss();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                      (route) => false);
                });
              }
            }
          },
          backgroundColor: Colors.cyan[900],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          child: Text(
            'Register Now',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xff13293D),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'NM',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xff006494),
          ),
          children: [
            TextSpan(
              text: 'IT',
              style: TextStyle(color: Color(0xff000000), fontSize: 30),
            ),
            TextSpan(
              text: 'Hostel',
              style: TextStyle(color: Color(0xff1B98E0), fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Registration Number"),
        _entryField("FullName"),
        _entryField("USN"),
        _entryField("Email ID"),
        _entryField("Phone Number"),
        _entryField("Semester"),
        _entryField("Mother`s Contact No."),
        _entryField("Father`s Contact No."),
        _entryField("Hostel Name"),
        _entryField("Room Number"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
