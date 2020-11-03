//import 'dart:async';
//import 'dart:ffi';
//
//import 'package:MyDen/constants/Constant_colors.dart';
//import 'package:MyDen/constants/bezierContainer.dart';
//import 'package:MyDen/resources/firebase_repository.dart';
//import 'package:MyDen/screens/tabScreen.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//
//import 'ActivationScreen.dart';
//
//class emailVerification extends StatefulWidget {
//  final name;
//
//  const emailVerification({Key key, this.name}) : super(key: key);
//
//  @override
//  _emailVerificationState createState() => _emailVerificationState();
//}
//
//class _emailVerificationState extends State<emailVerification> {
//  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//
//  void showScaffold(String message) {
//    _scaffoldKey.currentState.showSnackBar(SnackBar(
//      content: Text(message),
//    ));
//  }
//  bool _isUserEmailVerified;
//  bool isLoading = false;
//  final interval = const Duration(seconds: 1);
//
//  final int timerMaxSeconds = 20;
//
//  int currentSeconds = 0;
//
//  String get timerText =>
//      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';
//
//  startTimeout([int milliseconds]) {
//    var duration = interval;
//    Timer.periodic(duration, (timer) {
//      setState(() {
//        // print(timer.tick);
//        currentSeconds = timer.tick;
//        if (timer.tick >= timerMaxSeconds) timer.cancel();
//      });
//    });
//  }
//
//  @override
//  void initState() {
//    startTimeout();
//    super.initState();
//  }
//
//  DatabaseMethods databaseMethods = new DatabaseMethods();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        key: _scaffoldKey,
//        body: Container(
//            height: MediaQuery.of(context).size.height,
//            child: Stack(
//              children: [
//                CustomPaint(
//                  child: Container(
//                    height: 300.0,
//                  ),
//                  painter: CurvePainter(),
//                ),
//                Padding(
//                  padding:
//                      EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 50),
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Column(
//                        children: [
//                          // color: UniversalVariables.background,
//                          Padding(
//                            padding: EdgeInsets.all(9),
//                            child: Text(
//                              "Email verification link has been send to your mail,  please click on the link to verify  ",
//                              style: TextStyle(
//                                  color: UniversalVariables.ScaffoldColor,
//                                  fontWeight: FontWeight.w800,
//                                  wordSpacing: 5),
//                            ),
//                          ),
//                          SizedBox(
//                            height: 10,
//                          ),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.end,
//                            children: [
//                              timerText == "00: 00"
//                                  ? GestureDetector(
//                                      onTap: () {
//                                        resendEmilVerification();
//                                      },
//                                      child: Text(" Resend link",
//                                          style: TextStyle(
//                                            color: UniversalVariables
//                                                .ScaffoldColor,
//                                            fontWeight: FontWeight.w800,
//                                          )),
//                                    )
//                                  : Text(timerText,
//                                      style: TextStyle(
//                                        color: Colors.red[500],
//                                        fontWeight: FontWeight.w800,
//                                      )),
//                            ],
//                          )
//                        ],
//                      ),
//                      RaisedButton(
//                        color: UniversalVariables.background,
//                        //elevation: 10,
//                        onPressed: () {
//                          checkEmilVerifiedOrNot();
//                        },
//                        child: Text(
//                          "Email Verified",
//                          style: TextStyle(
//                            color: UniversalVariables.ScaffoldColor,
//                            fontWeight: FontWeight.w800,
//                          ),
//                        ),
//                      )
//                    ],
//                  ),
//                )
//              ],
//            )));
//  }
//
//  void authenticateUser(FirebaseUser user) {
//    databaseMethods.authenticateUser(user).then((isNewUser) {
//      if (isNewUser) {
//        print(user.displayName);
//        print(user.email);
//        Map userData = {
//          "uid": user.uid,
//          "email": user.email,
//          "nickname": widget.name,
//          "photoUrl": ""
//        };
//        databaseMethods.addDataAfterSignUp(userData).then((value) {
//          Navigator.pushReplacement(context,
//              MaterialPageRoute(builder: (context) {
//            return ActivationScreen();
//          }));
//        });
//      } else {
//        Navigator.pushReplacement(context,
//            MaterialPageRoute(builder: (context) {
//          return TabBarScreen();
//        }));
//      }
//    });
//  }
//
//  checkEmilVerifiedOrNot() async {
//    await FirebaseAuth.instance.currentUser()..reload();
//    final FirebaseUser user = await databaseMethods.getCurrentUser();
//    print(user);
//    try {
//      print("click");
//      if(user.isEmailVerified){
//        print("click2");
//        authenticateUser(user);
//        Navigator.pushReplacement(context,
//            MaterialPageRoute(builder: (context) => ActivationScreen()));
//      }else{
//        showScaffold("First Verify Your email id");
//      }
//
//    }catch(e){
//      print(e.toString());
//    }
//  }
//
//
//
//
//  resendEmilVerification() async {
//    final FirebaseUser user = await databaseMethods.getCurrentUser();
//    try{
//      await user.sendEmailVerification();
//      setState(() {
//        isLoading = false;
//      });
//      Fluttertoast.showToast(msg: "New verifaction link is send to your mail",backgroundColor: UniversalVariables.background);
//
//    } catch(e){
//      print(e);
//      Fluttertoast.showToast(msg: e,backgroundColor: UniversalVariables.background);
//
//
//    }
//  }
//}
