import 'dart:collection';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myden/constants/ConstantTextField.dart';
import 'package:myden/constants/Constant_colors.dart';
import 'package:myden/constants/bezierContainer.dart';

class AddGaurds extends StatefulWidget {
  @override
  _AddGaurdsState createState() => _AddGaurdsState();
}

class _AddGaurdsState extends State<AddGaurds> {
  File _image;
  String photoUrl = "";
  // String constantUid = Uuid().v1();
  var document = [
    'Adhar Card',
    'PAN Card',
  ];
  bool isExpanded = false;
  var activationValue = "";
  var checkSelectedType = "";
  validationKey changeValidation;

  HashMap<String, validationKey> documentList =
      HashMap<String, validationKey>();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  TextEditingController _guardCompanyController = TextEditingController();
  TextEditingController _guardNameController = TextEditingController();
  TextEditingController _guardMobileController = TextEditingController();
  TextEditingController _guardOtherMobileController = TextEditingController();
  TextEditingController _guardStartDateController = TextEditingController();
  TextEditingController _guardDutyTimingController = TextEditingController();
  TextEditingController _adharCardController = TextEditingController();
  TextEditingController _type = TextEditingController();
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

  AddDataToSociety() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
//      await Firestore.instance
//          .collection('Society')
//          .document(activationValue)
//          .collection("Guards")
//          .document(activationValue)
//          .setData({
//        "details": FieldValue.arrayUnion([
//          {
//            "ID": _adharCardController.text,
//            "status": true,
//          }
//        ])
//      }, merge: true);
    }
  }

  SaveInformation() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      String fileName = 'Guards/${DateTime.now()}.png';
//      StorageReference reference =
//          FirebaseStorage.instance.ref().child(fileName);
//      StorageUploadTask uploadTask = reference.putFile(_image);
//      StorageTaskSnapshot storageTaskSnapshot;
//      uploadTask.onComplete.then((value) {
//        if (value.error == null) {
//          storageTaskSnapshot = value;
//          storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
//            photoUrl = downloadUrl;
//            Guard guard = Guard(
//              guardCompanyName: _guardCompanyController.text,
//              guardName: _guardNameController.text,
//              mobileNumber: _guardMobileController.text,
//              otherMobileNumber: _guardOtherMobileController.text,
//              dutyTiming: _guardDutyTimingController.text,
//              startDate: DateFormat(global.dateFormat)
//                  .parse(_guardStartDateController.text),
//              photoUrl: photoUrl,
//              adharCard: _adharCardController.text,
//              enable: true,
//            );
//            Firestore.instance
//                .collection("Guards")
//                .document(_adharCardController.text)
//                .setData(jsonDecode(jsonEncode(guard.toJson())))
//                .then((data) {
//              History history = History(
//                  guardId: Uuid().v1(),
//                  startDate: DateFormat(global.dateFormat)
//                      .parse(_guardStartDateController.text),
//                  societyID: activationValue);
//              Firestore.instance
//                  .collection("Guards")
//                  .document(_adharCardController.text)
//                  .collection("records")
//                  .document(history.guardId)
//                  .setData(jsonDecode(jsonEncode(history.toJson())))
//                  .then((value) => setState(() {
//                        _showDialog();
//                      }));
//            });
//          });
//        }
//      }).catchError((err) {
//        setState(() {
//          isLoading = false;
//        });
//        Fluttertoast.showToast(msg: err.toString());
//      });
    }
  }

//  Future chooseFile() async {
//    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
//      setState(() {
//        _image = image;
//      });
//    });
//  }

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
              top: MediaQuery.of(context).size.height * 0.02,
              bottom: MediaQuery.of(context).size.height * 0.02),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          IgnorePointer(
                            child: constantTextField().InputField(
                                "Select Document Type",
                                "",
                                validationKey.time,
                                _type,
                                false,
                                IconButton(
                                  icon: Icon(Icons.arrow_back_ios),
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
                                  _type.text = val;
                                  setState(() {
                                    changeValidation = documentList[val];
                                  });
                                },
                                itemBuilder: (BuildContext context) {
                                  return document
                                      .map<PopupMenuItem<String>>((String val) {
                                    return new PopupMenuItem(
                                        child: new Text(val), value: val);
                                  }).toList();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      constantTextField().InputField(
                          "Guard AadharCard Number",
                          "abc.pvt.ltd",
                          changeValidation,
                          _adharCardController,
                          false,
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {},
                          ),
                          1,
                          TextInputType.name),
                      SizedBox(
                        height: 10,
                      ),
                      constantTextField().InputField(
                          "Guard Company Name",
                          "abc.pvt.ltd",
                          validationKey.companyName,
                          _guardCompanyController,
                          false,
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {},
                          ),
                          1,
                          TextInputType.name),
                      SizedBox(
                        height: 10,
                      ),
                      constantTextField().InputField(
                          "Guard Name",
                          "",
                          validationKey.name,
                          _guardNameController,
                          false,
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {},
                          ),
                          1,
                          TextInputType.name),
                      SizedBox(
                        height: 10,
                      ),
                      constantTextField().InputField(
                          "Mobile No",
                          "abc.pvt.ltd",
                          validationKey.mobileNo,
                          _guardMobileController,
                          false,
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {},
                          ),
                          1,
                          TextInputType.number),
                      SizedBox(
                        height: 10,
                      ),
                      constantTextField().InputField(
                          "Other Mobile No",
                          "abc.pvt.ltd",
                          validationKey.mobileNo,
                          _guardOtherMobileController,
                          false,
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {},
                          ),
                          1,
                          TextInputType.number),
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
                      Row(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black54),
                            ),
                            child: _image != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      _image.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Icon(
                                    Icons.person,
                                    size: 90,
                                  ),
                          ),
                          Spacer(),
                          Card(
                              color: UniversalVariables.background,
                              elevation: 10,
                              child: GestureDetector(
                                onTap: () {
                                  // chooseFile();
                                  //getImage(true);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Choose Image",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      constantTextField().InputField(
                          "Duty Timing",
                          "abc.pvt.ltd",
                          validationKey.time,
                          _guardDutyTimingController,
                          false,
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {},
                          ),
                          1,
                          TextInputType.name),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: MaterialButton(
                              onPressed: () {
                                AddDataToSociety();
                                SaveInformation();
                              },
                              height: 50,
                              elevation: 10,
                              // padding: EdgeInsets.symmetric(vertical: 10),
                              color: UniversalVariables.background,
                              child: Text(
                                "Generate New Token",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(),
        ),
      ]),
    );
  }
}
