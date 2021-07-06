import 'package:flutter/material.dart';
import '../myOutpass.dart';


class OutpassPage extends StatefulWidget {
  @override
  _OutpassPageState createState() => _OutpassPageState();
}

class _OutpassPageState extends State<OutpassPage> {

  List<myOutpass> allData = [];


  @override
  void initState() {
  
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Container(
          child: allData.length == 0
              ? new Center(child:Text(' No Data Available',))
              : new ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return UI(
                      allData[index].outpassName,
                      allData[index].outpassDate,
                      allData[index].outpassDepartureTime,
                      allData[index].outpassInTime,
                      allData[index].outpassAddress,
                      allData[index].status,
                    );
                  },
                )),
    );
  }

  Widget UI(String outpassName, String outpassDate, String outpassDepartureTime,String outpassInTime, String outpassAddress,String status) {
    return new Card(
      elevation: 10.0,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text('personNameOutpass : $outpassName',style: Theme.of(context).textTheme.title,),
            new Text('date : $outpassDate'),
            new Text('departureTime : $outpassDepartureTime'),
            new Text('inTime : $outpassInTime'),
            new Text('address : $outpassAddress'),
            Row(children: <Widget>[
              Text("Status :"),
              Image.network("$status")
            ],
            ),
            RaisedButton(
              onPressed: (){
                var dataOutpass = {
                    'status': 'http://aux4.iconspalace.com/uploads/71514384467766585.png'
      };
      
              },
              child: Text('Accept'),
            )
          ],
        ),
      ),
    );
  }
}