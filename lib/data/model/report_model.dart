class ReportModel{
  late int id;
  int transactionTypeId;
  DateTime reportTime;
  DateTime startTime;
  DateTime endTime;

  ReportModel({required this.transactionTypeId, required this.reportTime, required this.startTime, required this.endTime});
  ReportModel.withId({required this.id, required this.transactionTypeId, required this.reportTime, required this.startTime, required this.endTime});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['transactionTypeId'] = transactionTypeId;
    map['reportTime'] = reportTime.toIso8601String();
    map['startTime'] = startTime.toIso8601String();
    map['endTime'] = endTime.toIso8601String();
    return map;
  }

  factory ReportModel.fromMap(Map<String, dynamic> map) {
    return ReportModel.withId(
        id: map['id'],
        transactionTypeId: map['transactionTypeId'],
        reportTime: map['reportTime'],
        startTime: map['startTime'],
        endTime: map['endTime'],
      );
  }
}