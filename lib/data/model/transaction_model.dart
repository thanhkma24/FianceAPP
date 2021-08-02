class TransactionModel {
  late int id;
  String name;
  DateTime time;
  String note;
  String moneyTotal;
  int transactionGroupId;
  TransactionModel({required this.name, required this.time, required this.note, required this.moneyTotal, required this.transactionGroupId });

  TransactionModel.withId(
      {required this.id, required this.name, required this.time, required this.note, required this.moneyTotal, required this.transactionGroupId});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['time'] = time.toIso8601String();
    map['note'] = note;
    map['moneyTotal'] = moneyTotal;
    map['transactionGroupId'] = transactionGroupId;
    return map;
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel.withId(
        id: map['id'],
        name: map['name'],
        time: DateTime.parse(map['time']),
        note: map['note'],
        moneyTotal: map['moneyTotal'],
        transactionGroupId: map['transactionGroupId']
    );
  }
}
