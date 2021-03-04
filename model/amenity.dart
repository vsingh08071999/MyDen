import 'package:intl/intl.dart';

class Amenity {
  String amenityId;
  String amenity;
  String operation;
  bool enable;


  Amenity({this.amenity, this.amenityId,this.operation,this.enable
   });

  Amenity.fromJson(Map<String, dynamic> json)
      : amenity = json['amenity'],
        amenityId = json['amenityId'],
        enable = json['enable'],
        operation = json['operation'];


  Map<String, dynamic> toJson() =>
      {
        'amenity': amenity,
        'amenityId':amenityId,
        'enable':enable,
        'operation': operation,

      };

}