import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myden/constants/ConstantTextField.dart';
import 'package:myden/constants/Constant_colors.dart';
import 'package:myden/constants/bezierContainer.dart';

class AddAnotherRAW extends StatefulWidget {
  @override
  _AddAnotherRAWState createState() => _AddAnotherRAWState();
}

class _AddAnotherRAWState extends State<AddAnotherRAW> {
  String tokn;
  TextEditingController _guardStartDateController = TextEditingController();
  TextEditingController _RAWController = TextEditingController();
  String msg = "hello,this is yor unique Code dont't share it with another ";
  // String message = uuid;

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

  String uuid;
  var raw = ['RAW'];
  String selected = "RAW";
  var activationValue = "";
  Future<Null> _selectDate(
      BuildContext context, DateTime firstDate, DateTime lastDate) async {
    DateTime selectedDate = firstDate;
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: firstDate,
        lastDate: lastDate);
    if (picked != null) // && picked != selectedDate)
      selectedDate = picked;
//    String _formattedate =
//        new DateFormat(global.dateFormat).format(selectedDate);
//    setState(() {
//      _guardStartDateController.value = TextEditingValue(text: _formattedate);
//    });
  }

  bool isLoading = false;
  SaveRAW() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

//      ActivationCode activationCode = ActivationCode(
//          iD: uuid,
//          type: _RAWController.text,
//          society: activationValue,
//          creationDate: DateFormat(global.dateFormat)
//              .parse(_guardStartDateController.text),
//          societyId: tokn,
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
                      Stack(children: [
                        IgnorePointer(
                          child: constantTextField().InputField(
                              "Select ",
                              "",
                              validationKey.towerNumber,
                              _RAWController,
                              false,
                              IconButton(
                                icon: Icon(Icons.arrow_drop_down),
                                onPressed: () {},
                              ),
                              1,
                              TextInputType.name),
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: PopupMenuButton<String>(
                              icon: const Icon(Icons.arrow_downward),
                              onSelected: (String val) {
                                _RAWController.text = val;
                              },
                              itemBuilder: (BuildContext context) {
                                return raw
                                    .map<PopupMenuItem<String>>((String val) {
                                  return new PopupMenuItem(
                                      child: new Text(val), value: val);
                                }).toList();
                              },
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          _selectDate(
                              context,
                              DateTime.now().subtract(Duration(days: 0)),
                              DateTime.now().add(Duration(days: 365)));
                        },
                        child: IgnorePointer(
                            child: constantTextField().InputField(
                                "Start Date",
                                "",
                                validationKey.date,
                                _guardStartDateController,
                                true,
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () {},
                                ),
                                1,
                                TextInputType.name)),
                      ),
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
                        tokn = RandomString(10);
                        //uuid = Uuid().v1();
                        SaveRAW();
                      },
                      height: 50,
                      elevation: 10,
                      // padding: EdgeInsets.symmetric(vertical: 10),
                      color: UniversalVariables.background,
                      child: Text(
                        "Add RAW",
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
