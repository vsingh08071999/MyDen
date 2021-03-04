
import 'dart:io';

import 'package:intl/intl.dart';

class Guard {
  String guardId;
  String guardCompanyName;
  String guardName;
  String mobileNumber;
  String otherMobileNumber;
  DateTime startDate;
  String photoUrl;
  String dutyTiming;
  bool enable;
  String documentType;
  String service;
  String documentNumber;
  String guardSalary;


  Guard({this.guardCompanyName, this.guardName, this.mobileNumber, this.otherMobileNumber, this.startDate,
    this.photoUrl, this.dutyTiming,this.enable,this.documentType,this.service,this.documentNumber,this.guardSalary,this.guardId});

  Guard.fromJson(Map<String, dynamic> json)
      : guardCompanyName = json['guardCompanyName'],
        guardName = json['guardName'],
        guardSalary = json['guardSalary'],
        mobileNumber = json['mobileNumber'],
        otherMobileNumber = json['otherMobileNumber'],
        startDate = DateTime.tryParse(json['startDate']),
        photoUrl = json['photoUrl'],
        enable = json['enable'],
        guardId = json['guardId'],
        documentType = json['documentType'],
         service = json["service"],
        documentNumber = json["documentNumber"],
        dutyTiming = json['dutyTiming'];


  Map<String, dynamic> toJson() =>
      {
        'guardCompanyName': guardCompanyName,
        'guardName': guardName,
        'service':service,
        'guardId':guardId,
        'mobileNumber': mobileNumber,
        'otherMobileNumber': otherMobileNumber,
        'startDate': startDate.toIso8601String(),
        'photoUrl': photoUrl,
        'enable':enable,
        'guardSalary':guardSalary,
        "documentNumber":documentNumber,
        'dutyTiming': dutyTiming,
        'documentType':documentType,
      };
}

class History {
  String guardId;
  String societyID;
  DateTime startDate;
  History({this.societyID ,this.startDate,this.guardId});
  History.fromJson(Map<String, dynamic> json)
      :
        guardId = json['guardId'],
        societyID = json['societyID'],
        startDate = DateTime.tryParse(json['startDate']);


  Map<String, dynamic> toJson() =>
      {
        'ID':guardId,
        'societyID':societyID,
        'startDate': startDate.toIso8601String(),
      };
}

