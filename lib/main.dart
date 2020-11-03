import 'package:flutter/material.dart';
import 'package:myden/screens/homeScreen.dart';
import 'package:myden/screens/splashScreen.dart';

import 'loginScreen/AdminSignIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
