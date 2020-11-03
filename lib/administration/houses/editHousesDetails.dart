import 'package:flutter/material.dart';
import 'package:myden/constants/ConstantTextField.dart';
import 'package:myden/constants/Constant_colors.dart';
import 'package:myden/constants/bezierContainer.dart';

class EditHousesDetails extends StatefulWidget {
  @override
  _EditHousesDetailsState createState() => _EditHousesDetailsState();
}

class _EditHousesDetailsState extends State<EditHousesDetails> {
  TextEditingController _flatNumberController = TextEditingController();
  TextEditingController _flatOwnerController = TextEditingController();
  TextEditingController _flatMemberController = TextEditingController();
  TextEditingController _towerController = TextEditingController();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  var activationValue = "";
  SaveInformation() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
//
//      House house = House(
//        houseId: widget.house.houseId,
//        flatMember: _flatMemberController.text,
//        flatNumber: _flatNumberController.text,
//        flatOwner: _flatOwnerController.text,
//        tower: _towerController.text,
//        tokenNo: widget.house.tokenNo,
//        enable: true,
//      );
//      await Firestore.instance
//          .collection('Society')
//          .document(activationValue)
//          .collection("Houses")
//          .document(widget.house.houseId)
//          .updateData(jsonDecode(jsonEncode(house.toJson())))
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
      body: Stack(
        children: [
          Positioned(
            top: -MediaQuery.of(context).size.height * .15,
            right: -MediaQuery.of(context).size.width * .4,
            child: BezierContainer(),
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
                          SaveInformation();
                        },
                        height: 50,
                        elevation: 10,
                        // padding: EdgeInsets.symmetric(vertical: 10),
                        color: UniversalVariables.background,
                        child: Text(
                          "Update Houses",
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
        ],
      ),
    );
  }
}
