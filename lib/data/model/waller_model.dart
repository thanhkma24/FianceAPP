class WallerModel{
   late int id;
   String name;
   double moneyTotals;
   double balance;
   String currency;
   bool status;
   
  WallerModel({required this.name, required this.moneyTotals, required this.balance, required this.currency, required this.status});
  WallerModel.withId({required this.id, required this.name, required this.moneyTotals, required this.balance, required this.currency, required this.status});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['moneyTotals'] = moneyTotals;
    map['balance'] = balance;
    map['currency'] = currency;
    map['status'] = status;
    return map;
  }

  factory WallerModel.fromMap(Map<String, dynamic> map) {
    return WallerModel.withId(
        id: map['id'],
        name: map['name'],
        moneyTotals: map['moneyTotals'],
        balance: map['balance'],
        currency: map['currency'],
        status: map['status'],

      );
  }
}