import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _SignupPageState createState() => new _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _email, _password = "", _confirmpassword = "";
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = Theme(
        data: ThemeData(
          primaryColor: Color(0xff1B98E0),
          primaryColorDark: Color(0xffE7DFC6),
        ),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          autofocus: true,
          initialValue: '',
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Reg. No.',
            hintStyle: new TextStyle(color: Color(0xffE8F1F2)),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffE8F1F2), width: 2.0),
                borderRadius: BorderRadius.circular(32.0)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
          onChanged: (value) {
            setState(() {
              _email = value;
            });
          },
        ));

    final password = Theme(
        data:ThemeData(
          primaryColor: Color(0xff1B98E0),
          primaryColorDark: Color(0xffE7DFC6),
        ),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          autofocus: true,
          initialValue: '',
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: new TextStyle(color: Color(0xffE8F1F2)),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffE8F1F2), width: 2.0),
                borderRadius: BorderRadius.circular(32.0)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
          onChanged: (value) {
            setState(() {
              _password = value;
            });
          },
        ));

    final confirmPassword = Theme(
        data: ThemeData(
          primaryColor: Color(0xff1B98E0),
          primaryColorDark: Color(0xffE7DFC6),
        ),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          autofocus: true,
          initialValue: '',
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Confirm Password',
            hintStyle: new TextStyle(color: Color(0xffE8F1F2)),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffE8F1F2), width: 2.0),
                borderRadius: BorderRadius.circular(32.0)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
          onChanged: (value) {
            setState(() {
              _confirmpassword = value;
            });
          },
        ));

    final forgotLabel = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: MaterialButton(
        
        height: 47.0,
        onPressed: () {
          Navigator.of(context).popAndPushNamed('/information');
        },
        splashColor: Color(0xff131B23),
        color: Color(0xff1B98E0),
        child: Text('Confirm',
            style: TextStyle(color: Color(0xffE8F1F2), fontSize: 15.0)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/background1.jpg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          new Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                logo,
                SizedBox(height: 48.0),
                email,
                SizedBox(height: 8.0),
                password,
                SizedBox(height: 8.0),
                confirmPassword,
                SizedBox(height: 24.0),
                forgotLabel
              ],
            ),
          ),
        ],
      ),
    );
  }
}
