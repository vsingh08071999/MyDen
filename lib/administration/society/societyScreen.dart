import 'package:flutter/material.dart';
import 'package:myden/administration/society/addSociety.dart';
import 'package:myden/constants/bezierContainer.dart';

class SocietyScreen extends StatefulWidget {
  @override
  _SocietyScreenState createState() => _SocietyScreenState();
}

class _SocietyScreenState extends State<SocietyScreen> {
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddSociety()));
        },
      ),
    );
  }
}
