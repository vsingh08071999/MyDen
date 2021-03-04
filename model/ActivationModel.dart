class ActivationCode {
  String iD;
  String type;
  String society;
  DateTime creationDate;
  String societyId;
  bool enable;
  String flatNo;
  bool master;
  String password;
  String enableId;


  ActivationCode({this.iD, this.type,this.society, this.creationDate,
    this.societyId, this.enable,this.flatNo,this.master,this.password,this.enableId});

  ActivationCode.fromJson(Map<String, dynamic> json)
      : iD = json['iD'],
        type = json['type'],
        master = json['master'],
        flatNo = json['flatNo'],
        password = json['password'],
        society = json['society'],
        creationDate = DateTime.tryParse(json['creationDate']),
        societyId = json['tokenNo'],
        enableId = json['enableId'],
        enable = json['enable'];

  Map<String, dynamic> toJson() =>
      {
        'iD': iD,
        'type': type,
        'master': master,
        'password':password,
        'flatNo': flatNo,
        'society': society,
        'enableId':enableId,
        'creationDate': creationDate.toIso8601String(),
        'tokenNo': societyId,
        'enable' : enable
      };

}
