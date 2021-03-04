import 'package:intl/intl.dart';

class RWAModel {
  String RWAId;
  String token;
  bool enable;


  RWAModel({this.token, this.RWAId,this.enable
  });

  RWAModel.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        RWAId = json['RWAId'],
        enable = json['enable'];



  Map<String, dynamic> toJson() =>
      {
        'token': token,
        'RWAId':RWAId,
        'enable':enable,


      };

}