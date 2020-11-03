import 'package:flutter/material.dart';
import 'package:myden/administration/gaurds/addAnotherRAW.dart';
import 'package:myden/administration/gaurds/addGaurds.dart';
import 'package:myden/administration/gaurds/editGaurds.dart';
import 'package:myden/constants/bezierContainer.dart';

class GaurdsScreen extends StatefulWidget {
  @override
  _GaurdsScreenState createState() => _GaurdsScreenState();
}

class _GaurdsScreenState extends State<GaurdsScreen> {
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
                child: Text('editGaurds'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditGaurds()));
                },
              ),
              RaisedButton(
                child: Text('Add Another RAW'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddAnotherRAW()));
                },
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddGaurds()));
        },
      ),
    );
  }
}
