class SocietyTotalSalary {
  String societySalaryId;
  String headerName;
  String fixAmount;
  String unitPrice;
  String unit;
  String totalAmount;
  DateTime billGenerateDate;
  bool enable;
  String salaryMode;

  SocietyTotalSalary({
    this.societySalaryId,
    this.headerName,
    this.fixAmount,
    this.unit,
    this.enable,
    this.totalAmount,
    this.unitPrice,
    this.billGenerateDate,
    this.salaryMode,
  });

  SocietyTotalSalary.fromJson(Map<String, dynamic> json)
      : societySalaryId = json['societySalaryId'],
        headerName = json['headerName'],
        fixAmount = json['fixAmount'],
        enable = json['enable'],
        unitPrice = json['unitPrice'],
        salaryMode = json['salaryMode'],
        unit = json['unit'],

        totalAmount = json['totalAmount'],
        billGenerateDate = DateTime.tryParse(json['billGenerateDate']);

  Map<String, dynamic> toJson() => {
        'societySalaryId': societySalaryId,
        'headerName': headerName,
        'enable': enable,
        'salaryMode':salaryMode,
        'fixAmount': fixAmount,
        'unitPrice': unitPrice,
        'unit': unit,
        'totalAmount': totalAmount,
        'billGenerateDate': billGenerateDate.toIso8601String(),
      };
}
