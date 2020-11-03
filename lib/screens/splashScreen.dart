//import 'dart:async';
//
//import 'package:MyDen/constants/Constant_colors.dart';
//import 'package:MyDen/constants/bezierContainer.dart';
//import 'package:MyDen/constants/themes.dart';
//import 'package:MyDen/loginScreen/ActivationScreen.dart';
//import 'package:MyDen/loginScreen/AdminSignIn.dart';
//import 'package:MyDen/loginScreen/EmailVerifactionScreen.dart';
//import 'package:MyDen/resources/firebase_repository.dart';
//import 'package:MyDen/screens/checkAccessList.dart';
//import 'package:MyDen/screens/tabScreen.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:MyDen/model/sharedperef.dart';
//import 'package:MyDen/constants/global.dart' as globals;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myden/constants/bezierContainer.dart';
import 'package:myden/loginScreen/AdminSignIn.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
//  DatabaseMethods databaseMethods = DatabaseMethods();
//  var loginType = "";
//  var activationValue = "";
//  Future<FirebaseUser> _checkAuth() async {
//    return await databaseMethods.getCurrentUser();
//  }

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  navigationPage() async {
    // await FirebaseAuth.instance.currentUser()..reload();
    //final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));

//    try {
//      print("click");
//      if (user != null) {
//        print("data get");
//        print(activationValue);
//        if (loginType == "emailLogin") {
//          if (activationValue != null || activationValue == '') {
//            Navigator.pushReplacement(
//                context, MaterialPageRoute(builder: (context) => accessList()));
//          } else if (user.isEmailVerified) {
//            print("bbbbbb");
//            Navigator.pushReplacement(context,
//                MaterialPageRoute(builder: (context) => ActivationScreen()));
//          } else {
//            Navigator.pushReplacement(context,
//                MaterialPageRoute(builder: (context) => emailVerification()));
//          }
//        } else if (activationValue != null || activationValue == '') {
//          Navigator.pushReplacement(
//              context, MaterialPageRoute(builder: (context) => accessList()));
//        } else {
//          print("aaaaaa");
//          Navigator.pushReplacement(context,
//              MaterialPageRoute(builder: (context) => ActivationScreen()));
//        }
//      } else {
//        Navigator.pushReplacement(
//            context, MaterialPageRoute(builder: (context) => LoginPage()));
//      }
//    } catch (e) {
//      print(e.toString());
//    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          CustomPaint(
            child: Container(
              height: 300.0,
            ),
            painter: CurvePainter(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        CircularProgressIndicator(),
                        Text(
                          "MY Den",
                          style: TextStyle(
                              fontSize: 35,
                              // color: ,
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
