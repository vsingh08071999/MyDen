import 'package:flutter/material.dart';
import 'package:myden/constants/ConstantTextField.dart';
import 'package:myden/constants/Constant_colors.dart';
import 'package:myden/constants/bezierContainer.dart';

class UpdateGates extends StatefulWidget {
  @override
  _UpdateGatesState createState() => _UpdateGatesState();
}

class _UpdateGatesState extends State<UpdateGates> {
  var gateOpen = [
    'Close',
    'Open',
  ];
  var gateOperation = [
    'Walking',
    'Vehicle',
  ];
  String dropdownOpen = "Open";
  String dropdownOperation = "Walking";
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController _gateNoController = TextEditingController();
  TextEditingController _gateOpenController = TextEditingController();
  TextEditingController _gateOperationController = TextEditingController();
  TextEditingController _entranceModeController = TextEditingController();
  TextEditingController _noOfDevicesController = TextEditingController();
  updateInformation() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

//      Gate gate = Gate(
//          gateId: widget.gate.gateId,
//          gateOpen: _gateOpenController.text,
//          gateOperation: _gateOperationController.text,
//          gateNo: _gateNoController.text,
//          gateEntranceMode: _entranceModeController.text,
//          noOfDevice: _noOfDevicesController.text,
//          enable: true,
//          tokenNo: widget.gate.tokenNo);
//
//      await Firestore.instance
//          .collection('Society')
//          .document(activationValue)
//          .collection("Gate")
//          .document(widget.gate.gateId)
//          .updateData(jsonDecode(jsonEncode(gate.toJson())))
//          .then((data) async {
//        setState(() {
//          isLoading = false;
//        });
//        _showDialog();
//      }).catchError((err) {
//        setState(() {
//          isLoading = false;
//        });
//        print(err.toString());
//        Fluttertoast.showToast(msg: err.toString());
//      });
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
              top: MediaQuery.of(context).size.height * 0.20,
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
                        constantTextField().InputField(
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
                        constantTextField().InputField(
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
                                      .map<PopupMenuItem<String>>((String val) {
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
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: 2,
                ),
                GestureDetector(
                    onTap: () {
                      updateInformation();
                    },
                    child: Card(
                        color: UniversalVariables.background,
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Update Event",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ))),
              ])
            ],
          ),
        ),
      ]),
    );
  }
}
