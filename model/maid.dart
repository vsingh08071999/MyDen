
import 'dart:io';

class Maid {
  String maidName;
  String mobileNumber;
  String otherMobileNumber;
  DateTime startDate;
  String photoUrl;
  String dutyTiming;
  bool enable;
  String adharCard;



  Maid({ this.maidName, this.mobileNumber, this.otherMobileNumber, this.startDate,
    this.photoUrl, this.dutyTiming,this.enable,this.adharCard});

  Maid.fromJson(Map<String, dynamic> json)
      :
        maidName = json['maidName'],
        mobileNumber = json['mobileNumber'],
        otherMobileNumber = json['otherMobileNumber'],
        startDate =  DateTime.tryParse(json['startDate']),
        photoUrl = json['photoUrl'],
        enable = json['enable'],
        adharCard =  json['adharCard'],
        dutyTiming = json['dutyTiming'];


  Map<String, dynamic> toJson() =>
      {

        'maidName': maidName,
        'mobileNumber': mobileNumber,
        'otherMobileNumber': otherMobileNumber,
        'startDate': startDate.toIso8601String(),
        'photoUrl': photoUrl,
        'enable':enable,
        'dutyTiming': dutyTiming,
        'adharCard':adharCard,
      };
}

class History {
  String maidId;
  String societyID;
  DateTime startDate;
  History({this.societyID ,this.startDate,this.maidId});
  History.fromJson(Map<String, dynamic> json)
      :
        maidId = json['ID'],
        societyID = json['societyID'],
        startDate =  DateTime.tryParse(json['startDate']);


  Map<String, dynamic> toJson() =>
      {
        'ID':maidId,
        'societyID':societyID,
        'startDate': startDate.toIso8601String(),
      };
}

