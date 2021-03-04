import 'dart:convert';

class Visitor {
  String houseId;
  String name;
  String mobileNumber;
  DateTime inviteDate;
  String visitorType;
  String visitorNumber;
  bool enable;
  String ownerName;
  String ownerHouse;
  String ownerMobileNumber;
  String token;
  String id;
  String societyId;
  String firstInviteTime;
  String secondInviteTime;
  String deletName;
  String inviteBye;
  bool allDay;
  bool inOut;
  bool accept;

  Visitor(
      {this.houseId,
        this.allDay,
        this.name,
        this.inOut,
        this.accept,
        this.mobileNumber,
        this.societyId,
        this.inviteDate,
        this.visitorType,
        this.firstInviteTime,
        this.secondInviteTime,
        this.enable,
        this.visitorNumber,
        this.ownerName,
        this.ownerHouse,
        this.ownerMobileNumber,
        this.token,
        this.inviteBye,
        this.deletName,
        this.id});

  Visitor.fromJson(Map<String, dynamic> json)
      : houseId = json['houseId'],
        name = json['name'],
        allDay = json['allDay'],
        id = json['id'],
        inOut = json['inOut'],
        accept = json['accept'],
        inviteBye = json['inviteBye'],
        secondInviteTime = json['secondInviteTime'],
        firstInviteTime = json['firstInviteTime'],
        societyId = json["societyId"],
        mobileNumber = json['mobileNumber'],
        inviteDate = DateTime.tryParse(json['inviteDate']),
        visitorType = json['visitorType'],
        visitorNumber = json['visitorNumber'],
        ownerName = json['ownerName'],
        enable = json['enable'],
        token = json['token'],
        deletName = json['deletName'],
        ownerMobileNumber = json['ownerMobileNumber'],
        ownerHouse = json['ownerHouse'];

  Map<String, dynamic> toJson() => {
    'houseId': houseId,
    'token': token,
    'allDay':allDay,
    'inOut':inOut,
    'accept':accept,
    'deletName':deletName,
    'secondInviteTime': secondInviteTime,
    'firstInviteTime': firstInviteTime,
    'id': id,
    'inviteBye':inviteBye,
    'name': name,
    'societyId': societyId,
    'ownerMobileNumber': ownerMobileNumber,
    'ownerHouse': ownerHouse,
    'ownerName': ownerName,
    'mobileNumber': mobileNumber,
    'inviteDate': inviteDate.toIso8601String(),
    'visitorType': visitorType,
    'visitorNumber': visitorNumber,
    'enable': enable
  };
}
