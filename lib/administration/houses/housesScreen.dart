import 'package:flutter/material.dart';
import 'package:myden/administration/gates/generateNewToken.dart';
import 'package:myden/administration/houses/addHouses.dart';
import 'package:myden/administration/houses/editHousesDetails.dart';
import 'package:myden/administration/houses/generateHouseToken.dart';
import 'package:myden/constants/bezierContainer.dart';

class HousesScreen extends StatefulWidget {
  @override
  _HousesScreenState createState() => _HousesScreenState();
}

class _HousesScreenState extends State<HousesScreen> {
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditHousesDetails()));
                },
              ),
              RaisedButton(
                child: Text('Generate Token'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GenerateHouseToken()));
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
              context, MaterialPageRoute(builder: (context) => AddHouses()));
        },
      ),
    );
  }
}
