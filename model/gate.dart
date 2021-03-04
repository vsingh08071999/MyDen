class Gate {
  String gateId;
  String gateNo;
  String gateOperation;
  String gateOpen;
  String gateEntranceMode;
  String noOfDevice;
  bool enable;
  String tokenNo;




  Gate({this.gateNo, this.gateOperation,this.gateOpen, this.gateEntranceMode,
    this.noOfDevice,this.gateId ,this.enable,this.tokenNo});

  Gate.fromJson(Map<String, dynamic> json)
      : gateId = json["gateId"],
        gateNo = json['gateNo'],
        gateOperation = json['gateOperation'],
        gateOpen = json['gateOpen'],
        gateEntranceMode = json['gateEntranceMode'],
        tokenNo = json["tokenNo"],
        enable = json["enable"],
        noOfDevice = json['noOfDevice'];


  Map<String, dynamic> toJson() =>
      { 'gateId': gateId,
        'gateNo': gateNo,
        'gateOperation': gateOperation,
        'gateOpen': gateOpen,
        'gateEntranceMode': gateEntranceMode,
        'noOfDevice': noOfDevice,
        'tokenNo':tokenNo,
        'enable':enable
      };
}
