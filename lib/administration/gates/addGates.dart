import 'package:flutter/material.dart';
import 'package:myden/constants/ConstantTextField.dart';
import 'package:myden/constants/Constant_colors.dart';
import 'package:myden/constants/bezierContainer.dart';

class AddGates extends StatefulWidget {
  @override
  _AddGatesState createState() => _AddGatesState();
}

class _AddGatesState extends State<AddGates> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  TextEditingController _gateNoController = TextEditingController();
  TextEditingController _gateOpenController = TextEditingController();
  TextEditingController _gateOperationController = TextEditingController();
  TextEditingController _entranceModeController = TextEditingController();
  TextEditingController _noOfDevicesController = TextEditingController();
  TextEditingController _tokenController = TextEditingController();
  var gateOpen = [
    'Close',
    'Open',
  ];
  var gateOperation = [
    'Walking',
    'Vehicle',
  ];
  SaveInformation() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

//      Gate gate = Gate(
//          gateId: uuid,
//          gateOpen: _gateOpenController.text,
//          gateNo: _gateNoController.text,
//          gateEntranceMode: _entranceModeController.text,
//          gateOperation: _gateOperationController.text,
//          enable: true,
//          tokenNo: _tokenController.text,
//          noOfDevice: _noOfDevicesController.text);
//      print(gate.toJson());
//      await Firestore.instance
//          .collection('Society')
//          .document(activationValue)
//          .collection("Gate")
//          .document(gate.gateId)
//          .setData(jsonDecode(jsonEncode(gate.toJson())))
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
//          type: "Gate",
//          society: activationValue,
//          creationDate:DateTime.now(),
//          societyId: _tokenController.text,
//          enable: true
//      );
//
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
      body: Stack(
        children: [
          Positioned(
            top: -MediaQuery.of(context).size.height * .15,
            right: -MediaQuery.of(context).size.width * .4,
            child: BezierContainer(),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.30,
                left: MediaQuery.of(context).size.width * 0.30,
                top: MediaQuery.of(context).size.height * 0.10,
                bottom: MediaQuery.of(context).size.height * 0.10),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        constantTextField().InputField(
                            "Gate Name / No",
                            "67",
                            validationKey.gateNo,
                            _gateNoController,
                            false,
                            IconButton(
                              icon: Icon(Icons.access_time),
                            ),
                            1,
                            TextInputType.name),
                        SizedBox(
                          height: 10,
                        ),
                        Stack(children: [
                          IgnorePointer(
                            child: constantTextField().InputField(
                                "Gate Open ",
                                "Open",
                                validationKey.Description,
                                _gateOpenController,
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
                                  _gateOpenController.text = val;
                                },
                                itemBuilder: (BuildContext context) {
                                  return gateOpen
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
                        Stack(children: [
                          IgnorePointer(
                            child: constantTextField().InputField(
                                "Gate Operation",
                                "Walking / Vech.",
                                validationKey.name,
                                _gateOperationController,
                                false,
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.calendar_today),
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
                                    _gateOperationController.text = val;
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return gateOperation
                                        .map<PopupMenuItem<String>>(
                                            (String val) {
                                      return new PopupMenuItem(
                                          child: new Text(val), value: val);
                                    }).toList();
                                  },
                                ),
                              ))
                        ]),
                        SizedBox(
                          height: 10,
                        ),
                        constantTextField().InputField(
                            "Entrance Mode",
                            "",
                            validationKey.entrance,
                            _entranceModeController,
                            false,
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.calendar_today),
                            ),
                            1,
                            TextInputType.name
                            //Icon(Icons.calendar_today)

                            ),
                        SizedBox(
                          height: 10,
                        ),
                        constantTextField().InputField(
                            "No. of Devices ",
                            "",
                            validationKey.device,
                            _noOfDevicesController,
                            false,
                            IconButton(
                              icon: Icon(Icons.arrow_drop_down),
                              onPressed: () {},
                            ),
                            1,
                            TextInputType.number),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
//                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                  SizedBox(
//                    width: 2,
//                  ),
//                  GestureDetector(
//                      onTap: () {
//
//                        _tokenController.text = RandomString(10);
//                        uuid = Uuid().v1();
//                        SaveInformation();
//                        SaveActivation();
//                      },
//                      child: Card(
//                          color: UniversalVariables.background,
//                          elevation: 10,
//                          child: Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: Text(
//                              "Add Gate",
//                              style: TextStyle(
//                                  color: Colors.white,
//                                  fontWeight: FontWeight.w800),
//                            ),
//                          ))),
//                ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: MaterialButton(
                        onPressed: () {
                          SaveInformation();
                          SaveActivation();
                        },
                        height: 50,
                        elevation: 10,
                        // padding: EdgeInsets.symmetric(vertical: 10),
                        color: UniversalVariables.background,
                        child: Text(
                          "Add Gate",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w800),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
