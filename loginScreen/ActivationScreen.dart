import 'dart:convert';

import 'package:MyDen/bloc/AuthBloc.dart';
import 'package:MyDen/constants/ConstantTextField.dart';
import 'package:MyDen/constants/Constant_colors.dart';
import 'package:MyDen/model/ActivationModel.dart';
import 'package:MyDen/model/RWA.dart';
import 'package:MyDen/model/houses.dart';
import 'package:MyDen/model/notice.dart';
import 'package:MyDen/model/sharedperef.dart';
import 'package:MyDen/model/user_model.dart';
import 'package:MyDen/resources/firebase_repository.dart';
import 'package:MyDen/screens/tabScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:MyDen/constants/global.dart' as globals;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class ActivationScreen extends StatefulWidget {
  @override
  _ActivationScreenState createState() => _ActivationScreenState();
}

class _ActivationScreenState extends State<ActivationScreen> {
  TextEditingController _activationController = TextEditingController();
  TextEditingController _societyController = TextEditingController();
  UserData _userData = UserData();
  List<ActivationCode> activationCodelist = List<ActivationCode>();
  var tttt = "";
  var society = [
    'MilanDeep',
    'MilanSar',
  ];

  bool isLoading = false;

  @override
  void initState() {
    _userData = context.bloc<AuthBloc>().getCurrentUser();
    print(_userData.email);
    print(_userData.uid);
    //  _getUserDetails();
    // getActivationCode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                ),
                Text("Activated Code"),
                SizedBox(
                  height: 10,
                ),
                Form(
                    key: globals.formKey,
                    child: Column(
                      children: [
                        constantTextField().InputField(
                            "Enter Activation Code",
                            "",
                            validationKey.societyCode,
                            _activationController,
                            false,
                            IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {}),
                            1,
                            1,
                            TextInputType.emailAddress,
                            false),
                        SizedBox(
                          height: 10,
                        ),

                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    getActivationCode();
                   // _tokenRegisterTTTTT();
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          child: isLoading
              ? Container(
                  color: Colors.transparent,
                  child: Center(child: CircularProgressIndicator()),
                )
              : Container(),
        ),
      ],
    ));
  }

  // getGetDetails() async {
  //   QuerySnapshot querySnapshot;
  //   querySnapshot = await Firestore.instance
  //       .collection('ActivationCode')
  //       .where("enable", isEqualTo: true)
  //       .getDocuments();
  //   setState(() {
  //     var otp = ["tokenNo"];
  //     print(otp);
  //   });
  // }

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Your Activation Code Is Wrong ",
                  style: TextStyle(color: UniversalVariables.background),
                )
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              child: Text('ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  buttonclicked() {
    Firestore.instance
        .collection('ActivationCode')
        .document()
        .updateData({"enable": false});
  }

  getActivationCode() async {
    if (globals.formKey.currentState.validate()) {
      await Firestore.instance
          .collection('ActivationCode')
          .where("tokenNo", isEqualTo: _activationController.text)
          .where("enable", isEqualTo: true)
          .where("type", isEqualTo: "RWA")
          .getDocuments()
          .then((value) {
        print(value.documents.length);
        // _GETTOKEN();
        // _tokenRegister(value,tttt);

        // value.documents.forEach((element) {
        //   print(element["iD"]);
        //   _tokenRegister(element["society"],element["iD"]);
        // });

        if (value.documents.length == 1) {
          setState(() {
            globals.societyId = value.documents[0]["society"];
            savelocalCode()
                .toSaveStringValue(societyId, value.documents[0]["society"]);
            isLoading = true;
          });
          saveAccesList(value.documents[0]["society"]);
          disableSocietyId(value.documents[0]['iD']);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => TabBarScreen()));
        } else {
          _showDialog();
        }
      });
    }
  }

  disableSocietyId(String societyEnable) {
    Firestore.instance
        .collection('ActivationCode')
        .document(societyEnable)
        .updateData({"enable": false});
  }

  // saveRWA(String societyID) {
  //   RWAModel rwaModel = RWAModel(
  //       RWAId: Uuid().v1(),
  //       enable: true,
  //       token:
  //
  //   );
  //   Firestore.instance.collection("users").document(societyID)
  //       .collection("RWA")
  //       .document()
  // }

  _tokenRegister(QuerySnapshot value,String token) {
    print("jafskjfgkjahfgla");
    value.documents.forEach((element) {
        RWAModel rwaModel =
            RWAModel(RWAId: element['iD'], enable: true, token:token);
        Firestore.instance
            .collection("Society")
            .document(element['society'])
            .collection("RWA")
            .document(rwaModel.RWAId)
            .setData(jsonDecode(jsonEncode(rwaModel.toJson())), merge: true);

    });
  }



  // _tokenRegisterTTTTT(){
  //   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  //   _firebaseMessaging.getToken().then((token) {
  //     Firestore.instance.collection("users").document().setData({
  //       "token": token
  //     }, merge: true);
  //
  //   });
  // }


  saveAccesList(String societyIdName) {
    Firestore.instance.collection("users").document(_userData.uid).setData({
      "accessList": FieldValue.arrayUnion(
        [
          {
            "id": societyIdName,
            "type": "RWA",
            "status": true,
            "societyName": _societyController.text
          }
        ],
      ),
    }, merge: true);
  }
}
