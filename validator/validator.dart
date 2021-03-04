import 'dart:ui';

import 'package:intl/intl.dart';

class Validators {
  bool emailValidator(String email) {
    const Pattern _pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp _regex = new RegExp(_pattern);

    if (_regex.hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }

  phoneValidator(String phone) {
    if (phone.length > 5) {
      return true;
    } else {
      return false;
    }
  }

  passwordValidator(String password) {
    if (password.length > 6) {
      return true;
    } else {
      return false;
    }
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }

  houseNoValidator(String phone) {
    return phone.isEmpty || phone.length < 1
        ? "Enter your House number "
        : null;
  }

  String timeForApi(int seconds) {
    var secondOfDate = new DateTime.fromMillisecondsSinceEpoch(seconds);
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedString = formatter.format(secondOfDate);
    return formattedString;
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        // r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        r'^[^@]+@[^@]+\.[^@]+').hasMatch(this);
  }

  bool isValidPassword() {
    return this.length > 4 ? true : false;
  }

  bool isValidName() {
    return RegExp(r'^[a-zA-Z ]+$').hasMatch(this);
  }

  bool isValidNotice() {
    return RegExp(r'^[a-zA-Z ]+$').hasMatch(this);
  }

  bool isValidMobile() {
    return RegExp(r'(^(?:[+0]9)?[0-9]{10}$)').hasMatch(this);
  }

  bool isValidSociety() {
    return this.length > 5 ? true : false;
  }

  bool isValidPayment() {
    return RegExp(r'(^[0-9]+$)').hasMatch(this) && this.length < 6
        ? true
        : false;
  }

  bool isValidDescription() {
    return this.length > 15 ? true : false;
  }

  bool isValidActivationCode() {
    return this.length > 0 ? true : false;
  }

  bool isValidActiveDate() {
    return this.length > 0 ? true : false;
  }

  bool isValidActiveVenue() {
    return this.length > 2 ? true : false;
  }

  bool isValidActiveTime() {
    return this.length > 2 ? true : false;
  }

  bool isValidDevice() {
    return RegExp(r'(^[0-9]*$)').hasMatch(this) && this.length < 3
        ? true
        : false;
  }

  bool isValidEntrance() {
    return this.length > 0 && this.length < 6 ? true : false;
  }

  bool isValidGateNo() {
    return RegExp(r'(^[0-9]*$)').hasMatch(this) && this.length < 5
        ? true
        : false;
  }

  bool isValidTowerNo() {
    return RegExp(r'^[A-Z0-9]+$').hasMatch(this) && this.length < 6
        ? true
        : false;
  }

  bool isValidFlatNo() {
    return RegExp(r'^[A-Z0-9]+$').hasMatch(this) && this.length < 6
        ? true
        : false;
  }

  bool isValidFamilyNo() {
    return RegExp(r'(^[0-9]+$)').hasMatch(this) && this.length < 3
        ? true
        : false;
  }

  bool isValidOwnerName() {
    return this.length > 2 ? true : false;
  }

  bool isValidDocument() {
    return RegExp("[A-Z]{5}[0-9]{4}[A-Z]{1}").hasMatch(this) &&
        this.length < 11;
  }

  bool isValidAadhaar() {
    return RegExp(r'(^[0-9]{12}$)').hasMatch(this);
  }

  bool isValidGender() {
    return this.length > 0 ? true : false;
  }

  bool isValidOption() {
    return this.length > 1 ? true : false;
  }
  // bool isValidConfirmPassword(){
  //   return RegExp( r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])\S{8,}$').hasMatch(this);

  // }
  bool validDocumentType() {
    return this.length > 1 ? true : false;
  }

  bool isValidCompanyNmae() {
    return this.length > 6 && this.length < 70 ? true : false;
  }

  bool isValidSocietyCode() {
    return RegExp(r'^[a-zA-Z0-9 ]{10}$').hasMatch(this);
  }

  bool isGuardPassword() {
    return RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(this) && this.length == 6
        ? true
        : false;
  }

  bool houseArea() {
    return RegExp(r'(^[0-9]+$)').hasMatch(this) && this.length < 4
        ? true
        : false;
  }
}
