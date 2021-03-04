import 'dart:convert';

class House {
  String houseId;
  String flatMember;
  String flatNumber;
  String flatOwner;
  String tower;
  bool enable;
  String enableId;

  String area;


  House({this.flatMember,this.houseId, this.flatNumber,this.flatOwner, this.tower,this.enableId,
   this.enable,this.area});

  House.fromJson(Map<String, dynamic> json)
      : flatOwner = json['flatOwner'],
        flatNumber = json['flatNumber'],
        flatMember = json['flatMember'],
        tower = json['tower'],
        area = json['area'],
        houseId = json['houseId'],
       enableId = json['enableId'],
        enable = json['enable'];


  Map<String, dynamic> toJson() =>
      {
        'flatOwner': flatOwner,
        'houseId':houseId,
        'flatNumber': flatNumber,
        'flatMember': flatMember,
        'tower': tower,
        'enable' : enable,
        'enableId':enableId,
        'area':area
      };

}
