import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myden/constants/ConstantTextField.dart';
import 'package:myden/constants/Constant_colors.dart';
import 'package:myden/constants/bezierContainer.dart';

class GenerateHouseToken extends StatefulWidget {
  @override
  _GenerateHouseTokenState createState() => _GenerateHouseTokenState();
}

class _GenerateHouseTokenState extends State<GenerateHouseToken> {
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

  TextEditingController _controller = TextEditingController();

  String tokn;
  String uuid;
  updateToken() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
//      Firestore.instance
//          .collection("Society")
//          .document(activationValue)
//          .collection("Houses")
//          .document(widget.house.houseId)
//          .updateData({"tokenNo": _controller.text});
    }
  }

  updateActivationTokn() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
//      Firestore.instance
//          .collection("ActivationCode")
//          .document(widget.house.houseId)
//          .updateData({"tokenNo": _controller.text, "enable": true});
//      _showDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: -MediaQuery.of(context).size.height * .15,
          right: -MediaQuery.of(context).size.width * .4,
          child: BezierContainer(),
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
                child: IgnorePointer(
                    child: constantTextField().InputField(
                        "Generate new token",
                        "",
                        validationKey.activationCode,
                        _controller,
                        false,
                        IconButton(icon: Icon(Icons.add), onPressed: () {}),
                        1,
                        TextInputType.name)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: MaterialButton(
                      onPressed: () {
                        _controller.text = RandomString(10);
                      },
                      height: 50,
                      elevation: 10,
                      // padding: EdgeInsets.symmetric(vertical: 10),
                      color: UniversalVariables.background,
                      child: Text(
                        "Generate New Token",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: MaterialButton(
                      onPressed: () {
                        updateToken();
                        updateActivationTokn();
                      },
                      height: 50,
                      elevation: 10,
                      // padding: EdgeInsets.symmetric(vertical: 10),
                      color: UniversalVariables.background,
                      child: Text(
                        "Update",
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
