import 'package:flutter/material.dart';
import 'package:myden/administration/gates/addGates.dart';
import 'package:myden/administration/gates/generateNewToken.dart';
import 'package:myden/administration/gates/updateGates.dart';
import 'package:myden/constants/bezierContainer.dart';

class GateScreen extends StatefulWidget {
  @override
  _GateScreenState createState() => _GateScreenState();
}

class _GateScreenState extends State<GateScreen> {
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
                child: Text('updateGates'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UpdateGates()));
                },
              ),
              RaisedButton(
                child: Text('generate Gate'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GenerateNewToken()));
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
              context, MaterialPageRoute(builder: (context) => AddGates()));
        },
      ),
    );
  }
}
