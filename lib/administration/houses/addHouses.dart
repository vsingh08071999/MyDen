import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myden/constants/ConstantTextField.dart';
import 'package:myden/constants/Constant_colors.dart';
import 'package:myden/constants/bezierContainer.dart';

class AddHouses extends StatefulWidget {
  @override
  _AddHousesState createState() => _AddHousesState();
}

class _AddHousesState extends State<AddHouses> {
  TextEditingController _flatNumberController = TextEditingController();
  TextEditingController _flatOwnerController = TextEditingController();
  TextEditingController _flatMemberController = TextEditingController();
  TextEditingController _towerController = TextEditingController();
  TextEditingController _tokenController = TextEditingController();

  bool isLoading = false;
  String msg = "hello,this is yor unique Code dont't share it with another ";

  final formKey = GlobalKey<FormState>();
  static const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

  var activationValue = "";
  String RandomString(int strlen) {
    Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
    String result = "";
    for (var i = 0; i < strlen; i++) {
      result += chars[rnd.nextInt(chars.length)];
    }
    return result;
  }

  String tokn;
  String uuid;

  SaveInformation() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

//      House house = House(
//          houseId: uuid,
//          flatMember: _flatMemberController.text,
//          flatNumber: _flatNumberController.text,
//          flatOwner: _flatOwnerController.text,
//          tower: _towerController.text,
//          enable: true,
//          tokenNo: _tokenController.text);
//      await Firestore.instance
//          .collection('Society')
//          .document(activationValue)
//          .collection("Houses")
//          .document(house.houseId)
//          .setData(jsonDecode(jsonEncode(house.toJson())))
//          .then((data) async {
//        setState(() {
//          isLoading = false;
//        });
//        _showDialog();
//        //  Navigator.pop(context);
//      }).catchError((err) {
//        setState(() {
//          isLoading = false;
//        });
//        Fluttertoast.showToast(msg: err.toString());
//      });
    }
  }

  SaveActivation() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

//      ActivationCode activationCode = ActivationCode(
//          iD: uuid,
//          type: "Residents",
//          society: activationValue,
//          creationDate: DateTime.now(),
//          societyId: _tokenController.text,
//          enable: true);
//
//      await Firestore.instance
//          .collection('ActivationCode')
//          .document(activationCode.iD)
//          .setData(jsonDecode(jsonEncode(activationCode.toJson())))
//          .then((data) async {
//        setState(() {
//          isLoading = false;
//        });
//        //   _showDialog();
//        //  Navigator.pop(context);
//      }).catchError((err) {
//        setState(() {
//          isLoading = false;
//        });
//        Fluttertoast.showToast(msg: err.toString());
//      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: -MediaQuery.of(context).size.height * .10,
          left: -MediaQuery.of(context).size.width * .4,
          child: BezierContainerFour(),
        ),
        Positioned(
          bottom: -MediaQuery.of(context).size.height * .100,
          right: -MediaQuery.of(context).size.width * .4,
          child: BezierContainerThree(),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.30,
              left: MediaQuery.of(context).size.width * 0.30,
              top: MediaQuery.of(context).size.height * 0.30,
              bottom: MediaQuery.of(context).size.height * 0.20),
          child: ListView(
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      constantTextField().InputField(
                          "Enter Flat Number",
                          "c - 12",
                          validationKey.flatNo,
                          _flatNumberController,
                          false,
                          IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: null),
                          1,
                          TextInputType.name),
                      SizedBox(
                        height: 10,
                      ),
                      constantTextField().InputField(
                          "Enter Owner Name",
                          "Mr.Rajesh Singh",
                          validationKey.ownerName,
                          _flatOwnerController,
                          false,
                          IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: null),
                          1,
                          TextInputType.name),
                      SizedBox(
                        height: 10,
                      ),
                      constantTextField().InputField(
                          "Enter Tower Number",
                          " 67",
                          validationKey.towerNumber,
                          _towerController,
                          false,
                          IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: null),
                          1,
                          TextInputType.name),
                      SizedBox(
                        height: 10,
                      ),
                      constantTextField().InputField(
                          "Enter Family Number",
                          "3",
                          validationKey.familyMember,
                          _flatMemberController,
                          false,
                          IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: null),
                          1,
                          TextInputType.number),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: MaterialButton(
                      onPressed: () {
                        _tokenController.text = RandomString(10);
                        // uuid = Uuid().v1();
                        SaveInformation();
                        SaveActivation();
                      },
                      height: 50,
                      elevation: 10,
                      // padding: EdgeInsets.symmetric(vertical: 10),
                      color: UniversalVariables.background,
                      child: Text(
                        "Add Houses",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
