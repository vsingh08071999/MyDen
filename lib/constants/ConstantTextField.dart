import 'package:flutter/material.dart';
import '../constants/validator.dart';

enum validationKey {
  email,
  payment,
  Description,
  activationCode,
  date,
  venue,
  time,
  device,
  gateNo,
  entrance,
  ownerName,
  towerNumber,
  familyMember,
  documentType,
  adharCard,
  panCard,
  gender,
  password,
  username,
  mobileNo,
  otherMobileNo,
  name,
  companyName,
  administration,
  flatNo,
  controller,
  option
}

class constantTextField {
  Widget InputField(
    String labletext,
    String hintText,
    validationKey inputValidate,
    TextEditingController controller,
    bool isIconShow,
    IconButton image,
    int maxline,
    TextInputType keyboardType,
  ) {
    return TextFormField(
        keyboardType: keyboardType,
        maxLines: maxline,
        controller: controller,
        validator: (input) => validateInput(input, inputValidate),
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          suffixIcon: isIconShow ? image : null,
          labelText: labletext,
          hintText: hintText,
          border: OutlineInputBorder(),
          fillColor: Colors.white,
          filled: true,
        ));
  }

  String validateInput(String inputValue, validationKey key) {
    switch (key) {
      case validationKey.email:
        // ignore: unnecessary_statements
        return inputValue.isValidEmail() ? null : "Enter correct email";
        break;
      case validationKey.password:
        // ignore: unnecessary_statements
        return inputValue.isValidPassword()
            ? null
            : "Enter Password more then 7 letter";
        break;
      case validationKey.name:
        return inputValue.isValidName() ? null : "Enter correct Name";
        break;
      case validationKey.companyName:
        return inputValue.isValidName() ? null : "Enter correct Company Name";
        break;
      case validationKey.mobileNo:
        return inputValue.isValidMobile()
            ? null
            : "Please enter valid mobile number";
        break;
      case validationKey.administration:
        return inputValue.isValidSociety() ? null : "Enter Full Society Name";
        break;
      case validationKey.flatNo:
        return inputValue.isValidName() ? null : "Enter Correct Flat Number";
        break;
      case validationKey.payment:
        return inputValue.isValidPayment() ? null : "Enter payment";
        break;
      case validationKey.Description:
        return inputValue.isValidName() ? null : "Describe more than 5 words";
        break;
      case validationKey.activationCode:
        return inputValue.isValidActivationCode() ? null : "Enter correct Code";
        break;
      case validationKey.date:
        return inputValue.isValidActiveDate() ? null : "Enter Date here";
        break;
      case validationKey.venue:
        return inputValue.isValidActiveVenue() ? null : "Enter Venue name here";
        break;
      case validationKey.time:
        return inputValue.isValidActiveTime() ? null : "Enter Event time here";
        break;
      case validationKey.device:
        return inputValue.isValidDevice()
            ? null
            : "How Many device are there on gate";
        break;
      case validationKey.gateNo:
        return inputValue.isValidGateNo() ? null : "Enter Gate Number Here";
        break;
      case validationKey.entrance:
        return inputValue.isValidEntrance() ? null : "Enter Entrance Mode";
        break;
      case validationKey.familyMember:
        return inputValue.isValidFamilyNo()
            ? null
            : "Enter Total Family member ";
        break;
      case validationKey.ownerName:
        return inputValue.isValidOwnerName() ? null : "Enter owner Name";
        break;
      case validationKey.towerNumber:
        return inputValue.isValidTowerNo() ? null : "Enter Tower Number";
        break;
      case validationKey.documentType:
        return inputValue.isValidDocument()
            ? null
            : "Enter Correct PanCard Number";
        break;
      case validationKey.adharCard:
        return inputValue.isValidAadhaar()
            ? null
            : "The aadhaar number must be 12 characters long";
        break;
      case validationKey.gender:
        return inputValue.isValidGender() ? null : "Plz Select your Gender";
        break;
      case validationKey.option:
        return inputValue.isValidGender() ? null : "Plz choose your option";
        break;
    }
  }
}
