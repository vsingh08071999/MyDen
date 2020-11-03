import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myden/constants/ConstantTextField.dart';
import 'package:myden/constants/Constant_colors.dart';
import 'package:myden/constants/bezierContainer.dart';

class GenerateNewToken extends StatefulWidget {
  @override
  _GenerateNewTokenState createState() => _GenerateNewTokenState();
}

class _GenerateNewTokenState extends State<GenerateNewToken> {
  bool isLoading = false;
  var activationValue = "";
  final formKey = GlobalKey<FormState>();

  static const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

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
  updateToken() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
//      Firestore.instance
//          .collection("Society")
//          .document(activationValue)
//          .collection("Gate")
//          .document(widget.gate.gateId)
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
//          .document(widget.gate.gateId)
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
              bottom: MediaQuery.of(context).size.height * 0.10),
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
                        "Generate New Token",
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
