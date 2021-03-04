import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:MyDen/constants/global.dart' as global;

class UserData {
  String uid;
  String name;
  String email;
  String phoneNo;
  String username;
  String gender;
  String url;
  String profilePhoto;
  List<AccessList> accessList;
  bool emailVerified;

  UserData(
      {this.uid,
      this.name,
      this.email,
      this.phoneNo,
      this.username,
      this.gender,
      this.url,
      this.profilePhoto,
      this.accessList,
      this.emailVerified});
  Map toJson() {
    var data = Map<String, dynamic>();
    data['id'] = this.uid;
    data['nickname'] = this.name;
    data['email'] = this.email;
    data['phoneNo'] = this.phoneNo;
    data['name'] = this.name;
    data["gender"] = this.gender;
    data["url"] = this.url;
    data["photoUrl"] = this.profilePhoto;
    final Map<String, dynamic> d1 = new Map<String, dynamic>();
    if (this.accessList != null) {
      d1['accessList'] = this.accessList.map((v) => v.toMap(v)).toList();
    }
    return data;
  }

  UserData.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['id'];
    this.name = mapData['nickname'];
    this.email = mapData['email'];
    this.phoneNo = mapData['phoneNo'];
    this.name = mapData['name'];
    this.gender = mapData['gender'];
    this.url = mapData['url'];
    this.profilePhoto = mapData['photoUrl'];
    if (mapData['accessList'] != null) {
      List<AccessList> mainAccessList = List<AccessList>();
      for (int i = 0; i < mapData['accessList'].length; i++) {
        if (mapData['accessList'][i]['type'] == global.appType) {
          print(mapData['accessList'][i]['id']);
          AccessList accessList = AccessList();
          accessList.id = mapData['accessList'][i]['id'];
          accessList.type = mapData['accessList'][i]['type'];
          accessList.status = mapData['accessList'][i][true];
          accessList.societyName = mapData['accessList'][i]['societyName'];
          print(accessList);
          mainAccessList.add(accessList);
        }
      }
      this.accessList = mainAccessList;
    }
  }
}

class AccessList {
  String id;
  bool status;
  String type;
  String societyName;

  AccessList({this.id, this.status, this.type, this.societyName});
  Map toMap(AccessList obj) {
    var data = Map<String, dynamic>();
    data['id'] = obj.id;
    data['status'] = obj.status;
    data['type'] = obj.type;
    data['societyName'] = obj.societyName;

    return data;
  }

  AccessList.fromMap(Map<String, dynamic> mapData) {
    this.id = mapData['id'];
    this.status = mapData['status'];
    this.type = mapData['type'];
    this.societyName = mapData['societyName'];
  }
}
