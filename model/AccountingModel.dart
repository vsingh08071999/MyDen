class AccountingModel {
  String accountingId;
  String accountHeader;
  String area;
  String timePeriod;
  String payment;
  String fixedCharge;
String interestAmount;
 DateTime startDate;
 DateTime endDate;
  bool enable;
  String day;
  String mandatory;


  AccountingModel({this.accountingId,this.interestAmount,this.fixedCharge, this.accountHeader,this.area, this.startDate,
    this.endDate,
    this.enable,this.timePeriod,this.payment,this.day,this.mandatory});

  AccountingModel.fromJson(Map<String, dynamic> json)
      : accountingId = json['accountingId'],
    fixedCharge=json['fixedCharge'],
  interestAmount=json['interestAmount'],
        accountHeader = json['accountHeader'],
        timePeriod = json['timePeriod'],
        payment = json['payment'],
        area = json['area'],
        mandatory = json['mandatory'],
        day = json['day'],
       startDate = DateTime.tryParse(json['startDate']),
       endDate = DateTime.tryParse(json['endDate']),
        enable = json['enable'];

  Map<String, dynamic> toJson() =>
      {
        'accountingId': accountingId,
        'accountHeader': accountHeader,
        'timePeriod': timePeriod,
        'mandatory': mandatory,
        'payment': payment,
        'area': area,
        'day': day,
        'fixedCharge': fixedCharge,
        'interestAmount':interestAmount,
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
        'enable' : enable
      };

}
