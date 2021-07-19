import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../home_page.dart';
import '../networkHandler.dart';
import 'dart:convert';

class ComplainForm extends StatefulWidget {
  @override
  _ComplainFormState createState() => _ComplainFormState();
}

class _ComplainFormState extends State<ComplainForm> {
  NetworkHandler networkHandler = NetworkHandler();
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  String message;
  Map<String, String> data = {
    "reg_no": "21331",
    "name": "Avani Bhardwaj",
    "usn": "1NT18IS036",
    "email": "avanibhardwaj.100@gmail.com",
    "phoneNumber": "8867571643",
    "room_no": "121",
    "hostel": "Kumardhara",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Complain Form'),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Form(
            key: _key,
            autovalidate: _autovalidate,
            child: FormUI(),
          ),
        ),
      ),
    );
  }

  Widget FormUI() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Message'),
          onChanged: (val) {
            message = val;
          },
          validator: validateMessage,
          maxLines: 5,
          maxLength: 256,
        ),
        new RaisedButton(
          onPressed: _sendToServer,
          child: new Text('Send'),
        ),
      ],
    );
  }

  _sendToServer() async {
    if (message == null) {
      EasyLoading.showInfo("Please type your complaint");
    } else {
      data["complaint"] = "${message}";
      print(data);
      EasyLoading.show(status: 'Loading..');
      var response = await networkHandler.post("/student/complaint", data);
      EasyLoading.dismiss();
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("complaint filed");
        EasyLoading.showInfo("Complaint filed!");
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new HomePage()));
      }
    }
  }

  String validateMessage(String val) {
    return val.length == 0 ? "Write Something" : null;
  }
}
