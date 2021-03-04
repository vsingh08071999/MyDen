class SocietyBillHeader {
  String headerId;
  String headerName;
  String area;
  String timePeriod;
  String sqFit;
  String perUnit;
  String semiAmount;
  String semiUnitPrice;
  String semiUnit;
  bool enable;




  SocietyBillHeader({this.headerId, this.headerName,this.area,
    this.timePeriod,this.enable,this.sqFit,this.perUnit,this.semiAmount,this.semiUnit,this.semiUnitPrice
    });

  SocietyBillHeader.fromJson(Map<String, dynamic> json)
      : headerId = json['headerId'],
        headerName = json['headerName'],
        timePeriod = json['timePeriod'],
        enable = json['enable'],
        sqFit = json['sqFit'],
        perUnit = json['perUnit'],
        semiUnitPrice = json['semiUnitPrice'],
        semiUnit = json['semiUnit'],
        semiAmount = json['semiAmount'],
        area = json['area'];

  Map<String, dynamic> toJson() =>
      {
        'headerId': headerId,
        'headerName': headerName,
        'enable':enable,
        'sqFit':sqFit,
        'semiUnitPrice':semiUnitPrice,
        'semiAmount':semiAmount,
        'semiUnit':semiUnit,
        'perUnit':perUnit,
        'timePeriod': timePeriod,
        'area': area,

      };

}
