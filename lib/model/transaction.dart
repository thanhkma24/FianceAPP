class Transaction {
  String name;
  String description;
  String time;
  String amount;
  String type;
  int status;

  Transaction(
      {this.name = '',
      this.description = '',
      this.amount = '',
      this.status = -1,
      this.time = '',
      this.type = ''});
}
