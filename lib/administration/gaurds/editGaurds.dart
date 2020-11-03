import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myden/constants/ConstantTextField.dart';
import 'package:myden/constants/Constant_colors.dart';
import 'package:myden/constants/bezierContainer.dart';

class EditGaurds extends StatefulWidget {
  @override
  _EditGaurdsState createState() => _EditGaurdsState();
}

class _EditGaurdsState extends State<EditGaurds> {
  File _image;
  String photoUrl = "";
  var document = [
    'AdharCard',
    'PAN Card',
  ];

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  bool callOneFunction = false;

  TextEditingController _guardCompanyController = TextEditingController();
  TextEditingController _guardNameController = TextEditingController();
  TextEditingController _guardMobileController = TextEditingController();
  TextEditingController _guardOtherMobileController = TextEditingController();
  TextEditingController _guardStartDateController = TextEditingController();
  TextEditingController _guardDutyTimingController = TextEditingController();
  TextEditingController _adharCardController = TextEditingController();
  TextEditingController _type = TextEditingController();
  SaveOtherVendor() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

//      Firestore.instance
//          .collection('Guards')
//          .document(widget.guard.adharCard)
//          .updateData({
//        "adharCard": _adharCardController.text,
//        "guardCompanyName": _guardCompanyController.text,
//        "guardName": _guardNameController.text,
//        "mobileNumber": _guardMobileController.text,
//        "otherMobileNumber": _guardOtherMobileController.text,
//        "startDate":
//            DateFormat(global.dateFormat).parse(_guardStartDateController.text),
//        "dutyTiming": _guardDutyTimingController.text
//      }).then((data) async {
//        setState(() {
//          _showDialog();
//        });
//      });
    }
  }

  SaveInformation() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      print("_image");
//      print(_image);
//      String fileName = 'Guards/${DateTime.now()}.png';
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
//              startDate: DateFormat(global.dateFormat)
//                  .parse(_guardStartDateController.text),
//              dutyTiming: _guardDutyTimingController.text,
//              photoUrl: photoUrl,
//              enable: true,
//              adharCard: _adharCardController.text,
//            );
//            Firestore.instance
//                .collection(' Guards')
//                .document(widget.guard.adharCard)
//                .updateData(jsonDecode(jsonEncode(guard.toJson())))
//                .then((data) async {
//              setState(() {
//                _showDialog();
//              });
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
                          constantTextField().InputField(
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
                          Positioned(
                            right: 0,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: PopupMenuButton<String>(
                                icon: const Icon(Icons.arrow_downward),
                                onSelected: (String val) {
                                  _type.text = val;
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
                          "Guard AudharCard Number",
                          "abc.pvt.ltd",
                          validationKey.companyName,
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
                      constantTextField().InputField(
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
                          TextInputType.name),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black54),
                            ),
                            child: _image != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      _image.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            '',
                                            // widget.guard.photoUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        ) !=
                                        null
                                    ? Text("")
//                            CachedNetworkImage(
//                                        placeholder: (context, url) =>
//                                            Container(
//                                          child: CircularProgressIndicator(
//                                            valueColor: AlwaysStoppedAnimation<
//                                                    Color>(
//                                                UniversalVariables.background),
//                                          ),
//                                          width: 50.0,
//                                          height: 50.0,
//                                          padding: EdgeInsets.all(15.0),
//                                        ),
//                                        imageUrl: widget.guard.photoUrl,
//                                        fit: BoxFit.cover,
//                                      )
                                    : Icon(
                                        Icons.account_circle,
                                        size: 50.0,
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
                                if (callOneFunction != true) {
                                  SaveOtherVendor();
                                } else {
                                  SaveInformation();
                                }
                              },
                              height: 50,
                              elevation: 10,
                              // padding: EdgeInsets.symmetric(vertical: 10),
                              color: UniversalVariables.background,
                              child: Text(
                                "Add Guards",
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
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
