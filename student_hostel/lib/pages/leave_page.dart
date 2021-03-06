import 'package:flutter/material.dart';
import '../myOutpass.dart';



class LeavePage extends StatefulWidget {
  @override
  _LeavePageState createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {

  List<myLeave> allData = [];

  @override
  void initState() {
    
    
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          child: allData.length == 0
              ? new Center(child:Text(' No Data Available',))
              : new ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return UI(
                      allData[index].name,
                      allData[index].dateOfDeparture,
                      allData[index].dateOfArrival,
                      allData[index].departureTime,
                      allData[index].inTime,
                      allData[index].address,
                      allData[index].reason,
                      allData[index].status,
                    );
                  },
                )),);
    }

  Widget UI(String name, String dateOfDeparture, String dateOfArrival,String departureTime, String inTime,String address,String reason,String status) {
    return new Card(
      elevation: 10.0,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text('Name : $name',style: Theme.of(context).textTheme.title,),
            new Text('DateOfDeparture : $dateOfDeparture'),
            new Text('DateOfArrival : $dateOfArrival'),
            new Text('DepartureTime : $departureTime'),
            new Text('inTime : $inTime'),
            new Text('address : $address'),
            new Text('reason : $reason'),
            Row(children: <Widget>[
              Text("Status :"),
              Image.network("$status")
            ],)
          ],
        ),
      ),
    );
  }

}