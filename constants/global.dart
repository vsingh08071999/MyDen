import 'dart:collection';
import 'dart:io';

import 'package:MyDen/bloc/connectivityBloc.dart';
import 'package:flutter/cupertino.dart';

import 'ConstantTextField.dart';

//app
const String appName = 'MyDen';

var isLight = true;

var societyId = "";
String tokn;
String uuid;
String houseEnableId;
const appType = "RWA";

var documentData = {
  "Aadhar Card": validationKey.adharCard,
  "Pan Card": validationKey.panCard
};
validationKey changeValidation;

List<String> societyBillHeader = [
  "Water Bill",
  "Electricity Bill",
  "Property Bill",
  "Guard"
];
List<String> salaryMode = ["fixed", "Sq.fit", "PerUnit", 'Semi Fix'];
List<String> perList = ["fixed", "Sq.fit", "perUnit"];
List<String> list = ["Mandatory", "Non-Mandatory"];
List<String> timeList = ["Monthly", "Annually", "OneTime"];

//image
File image;
double imageHeight = 50;
double imageWidth = 50;
String photoUrl = "";

var RWATokenMsg = "hello,this is yor unique Code dont't share it with another ";

var primaryColorString = '#3145f5';
var secondaryColorString = '#3145f5';
int imageQuelity = 10;

var notificationKey =
    "key=AAAA7benEuU:APA91bFjLnjHeTglNFjyBZ6WMKZiEB5Gl7YOuOndQ6ILvtgG2uYNb40CEoXx3TSv5rbTomeS2-HZPnAlxgAN4exGIv54z5bnvSwxRFZaeHaVKVve7u7M06xlRrg75eK03dhbVAXYHdQy";

List<String> colors = [
  '#3145f5',
  '#32a852',
  '#e6230e',
  '#760ee6',
  '#db0ee6',
  '#db164e'
];
int colorsIndex = 0;
ConnectivityBloc connectivityBloc;

String dateFormat = "dd-MM-yyyy";

//constants
const USERS = 'users';
const GUARD = "Guard";
const SPORTS_DATA = 'sports';
const TOURNAMENTS_DATA = 'tournaments';
const MATCH_DATA = 'matches';
const CONTEST_DATA = 'contest';
const TEAM_DATA = 'feams';
const PARTICIPATION = 'participation';
const FEAMDETAILS = 'feamDetails';
const TRANSACTIONS = 'Transactions';
const SOCIETY = "Society";
const VISITORS = "Visitors";

final formKey = GlobalKey<FormState>();

////routes
//const String splashRoute = '/';
//const String homeRoute = '/home';
//const String authRoute = '/auth';
//const String loginScreen = '/login';
//const String signupScreen = '/signup';

//fonts
const String quickFont = 'Quicksand';

//colors
const COLOR_ACCENT = 0xFF304FFE;
const COLOR_PRIMARY_DARK = 0xFF1A237E;
const COLOR_PRIMARY = 0xFF3F51B5;
const FACEBOOK_BUTTON_COLOR = 0xFF3b5998;
const GOOGLE_BUTTON_COLOR = 0xFFFFFFFF;
