import 'package:flutter/material.dart';
import 'package:myden/administration/notices/addNotice.dart';
import 'package:myden/administration/notices/editNotice.dart';
import 'package:myden/constants/bezierContainer.dart';

class NoticesScreen extends StatefulWidget {
  @override
  _NoticesScreenState createState() => _NoticesScreenState();
}

class _NoticesScreenState extends State<NoticesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -MediaQuery.of(context).size.height * .15,
            right: -MediaQuery.of(context).size.width * .4,
            child: BezierContainer(),
          ),
          Row(
            children: [
              RaisedButton(
                child: Text('Edit Notice'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditNotice()));
                },
              ),
//              RaisedButton(
//                child: Text('Generate Token'),
//                onPressed: () {
////                  Navigator.push(
////                      context,
////                      MaterialPageRoute(
////                          builder: (context) => GenerateHouseToken()));
//                },
//              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNotice()));
        },
      ),
    );
  }
}
