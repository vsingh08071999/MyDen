//
//import 'package:MyDen/constants/ConstantTextField.dart';
//import 'package:MyDen/constants/Constant_colors.dart';
//import 'package:MyDen/model/sharedperef.dart';
//import 'package:MyDen/resources/firebase_repository.dart';
//import 'package:MyDen/screens/tabScreen.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//
//
//class ActivationScreen extends StatefulWidget {
//  @override
//  _ActivationScreenState createState() => _ActivationScreenState();
//}
//
//class _ActivationScreenState extends State<ActivationScreen> {
//  TextEditingController _activationController = TextEditingController();
//  DatabaseMethods databaseMethods = new DatabaseMethods();
//
//
//  final formKey = GlobalKey<FormState>();
//
//  bool isLoading = false;
//
//  @override
//  void initState() {
//   _getUserDetails();
//    super.initState();
//  }
//
//
//  Activate() async {
//    final FirebaseUser user = await databaseMethods.getCurrentUser();
//    final userid = user.uid;
//
//    if (formKey.currentState.validate()) {
//      setState(() {
//        savelocalCode().toSaveStringValue(activationCode, _activationController.text);
//        isLoading = true;
//      });
//
//
//      if (_activationController.text == "1" || _activationController.text == "2") {
//        setState(() {});
//        Firestore.instance.collection("users").document(userid).setData({
//          "accessList": FieldValue.arrayUnion([
//            {
//              "id": _activationController.text,
//              "type": "RWA",
//              "status": true,
//            }
//          ],),
//        },merge: true).then((value) =>Navigator.pushReplacement(
//            context,
//            MaterialPageRoute(
//                builder: (BuildContext context) => TabBarScreen(
//                ))));
//      }  else {
//        print(_activationController.text);
//        _showDialog();
//      }
//      return;
//    }
//  }
//
//  Future<void> _getUserDetails() async {
//  //  profile = await SharedPreferences.getInstance();
//    final FirebaseUser user = await databaseMethods.getCurrentUser();
//    final userid = user.uid;
//    Firestore.instance.collection('users').document(userid).get().then((value) {
//      setState(() {
//
//        var userphotoUrl = value.data['photoUrl'];
//        var nickname = value.data['nickname'];
//        var emailid = value.data['email'];
//        savelocalCode().toSaveStringValue(profile,userphotoUrl );
//        savelocalCode().toSaveStringValue(name, nickname);
//        savelocalCode().toSaveStringValue(email, emailid);
//
//
//        // profile.setString("userName", name);
//        // profile.setString('profile', picture);
//        // profile.setString('email', emailid);
//       // print(profile.get("profile"));
//      });
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Padding(
//        padding: const EdgeInsets.all(15.0),
//        child: SingleChildScrollView(
//          child: Column(
//            children: [
//              SizedBox(
//                height: MediaQuery.of(context).size.height / 3,
//              ),
//              Text("Activated Code"),
//              SizedBox(
//                height: 10,
//              ),
//              Form(
//                key: formKey,
//                child: constantTextField().InputField(
//                    "Enter Activation Code",
//                    "",
//                    validationKey.activationCode,
//                    _activationController,
//                    false,
//                    IconButton(
//                        icon: Icon(Icons.remove_red_eye), onPressed: () {}),
//                    1,
//                    TextInputType.emailAddress),
//              ),
//              SizedBox(
//                height: 10,
//              ),
//              RaisedButton(
//                onPressed: () {
//                  Activate();
//                },
//                child: Text("Submit"),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  Future<void> _showDialog() async {
//    return showDialog<void>(
//      context: context,
//      barrierDismissible: false, // user must tap button!
//      builder: (BuildContext context) {
//        return AlertDialog(
//          // title: Text('AlertDialog Title'),
//          content: SingleChildScrollView(
//            child: ListBody(
//              children: <Widget>[
//                Text(
//                  "Your Activation Code Is Wrong ",
//                  style: TextStyle(color: UniversalVariables.background),
//                )
//              ],
//            ),
//          ),
//          actions: <Widget>[
//            RaisedButton(
//              child: Text('ok'),
//              onPressed: () {
//                Navigator.pop(context);
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }
//}
