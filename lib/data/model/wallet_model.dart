class WalletModel{
  late int id;
  int walletTypeId;
  String name;
  double moneyTotals;
  double balance;
  String currency;
  bool status;

  WalletModel({required this.name, required this.walletTypeId, required this.moneyTotals, required this.balance, required this.currency, required this.status});
  WalletModel.withId({required this.id, required this.walletTypeId, required this.name, required this.moneyTotals, required this.balance, required this.currency, required this.status});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['walletTypeId'] = walletTypeId;
    map['name'] = name;
    map['moneyTotals'] = moneyTotals;
    map['balance'] = balance;
    map['currency'] = currency;
    map['status'] = status;
    return map;
  }

  factory WalletModel.fromMap(Map<String, dynamic> map) {
    return WalletModel.withId(
      id: map['id'],
      walletTypeId: map['walletTypeId'],
      name: map['name'],
      moneyTotals: map['moneyTotals'],
      balance: map['balance'],
      currency: map['currency'],
      status: map['status'],

    );
  }
}
