import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
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

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: MaterialButton(
        height: 47.0,
        onPressed: () {
          Navigator.of(context).popAndPushNamed('/splash');
        },
        splashColor: Color(0xff006494),
        color: Color(0xff247BA0),
        child: Text('Log In',
            style: TextStyle(color: Color(0xffE8F1F2), fontSize: 15.0)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Create New Account',
        style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 15.0,
            fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/signup');
      },
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
                SizedBox(height: 24.0),
                loginButton,
                forgotLabel
              ],
            ),
          ),
        ],
      ),
    );
  }
}
