// class Vendor {
//   String vendorId;
//   String name;
//   String enterTime;
//   String mobileNumber;
//   String vendor;
//   String photoUrl;
//   bool enable;
//
//
//   Vendor({this.vendorId, this.name,this.enterTime, this.mobileNumber,this.photoUrl,
//     this.vendor, this.enable});
//
//   Vendor.fromJson(Map<String, dynamic> json)
//       : vendorId = json['vendorId'],
//         name = json['name'],
//         enterTime = json['enterTime'],
//         mobileNumber = json['mobileNumber'],
//         vendor = json['vendor'],
//         photoUrl = json['photoUrl'],
//         enable = json['enable'];
//
//   Map<String, dynamic> toJson() =>
//       {
//         'vendorId': vendorId,
//         'name': name,
//         'enterTime': enterTime,
//         'mobileNumber': mobileNumber,
//         'vendor': vendor,
//         'enable' : enable,
//         'photoUrl':photoUrl
//       };
//
// }




import 'dart:io';

class Vendor {
  String name;
  String mobileNumber;
  String otherMobileNumber;
  DateTime startDate;
  String photoUrl;
  String dutyTiming;
  bool enable;
  bool passwordEnable;
  String documentNumber;
  String documentType;
  String service;
  String password;



  Vendor({ this.name, this.mobileNumber, this.otherMobileNumber, this.startDate,
    this.photoUrl, this.dutyTiming,this.enable,this.documentNumber,this.service,this.documentType,this.passwordEnable,this.password});

  Vendor.fromJson(Map<String, dynamic> json)
      :
        name = json['name'],
        documentType = json['documentType'],
        mobileNumber = json['mobileNumber'],
        otherMobileNumber = json['otherMobileNumber'],
        startDate =  DateTime.tryParse(json['startDate']),
        photoUrl = json['photoUrl'],
        enable = json['enable'],
        documentNumber =  json['documentNumber'],
        service = json['service'],
        password = json['password'],
        passwordEnable = json['passwordEnable'],
        dutyTiming = json['dutyTiming'];


  Map<String, dynamic> toJson() =>
      {

        'name': name,
        'password':password,
        'passwordEnable':passwordEnable,
        'documentType':documentType,
        'service':service,
        'mobileNumber': mobileNumber,
        'otherMobileNumber': otherMobileNumber,
        'startDate': startDate.toIso8601String(),
        'photoUrl': photoUrl,
        'enable':enable,
        'dutyTiming': dutyTiming,
        'documentNumber':documentNumber,
      };
}

class History {
  String Id;
  String societyID;
  DateTime startDate;

  History({this.societyID ,this.startDate,this.Id,});
  History.fromJson(Map<String, dynamic> json)
      :
        Id = json['ID'],
        societyID = json['societyID'],
        startDate =  DateTime.tryParse(json['startDate']);


  Map<String, dynamic> toJson() =>
      {
        'ID':Id,
        'societyID':societyID,
        'startDate': startDate.toIso8601String(),
      };
}


