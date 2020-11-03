import 'package:flutter/material.dart';
import 'package:myden/administration/events/addEvents.dart';
import 'package:myden/administration/events/editEvent.dart';
import 'package:myden/constants/bezierContainer.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
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
          RaisedButton(
            child: Text('Edit Events'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditEvents()));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddEvents()));
        },
      ),
    );
  }
}
