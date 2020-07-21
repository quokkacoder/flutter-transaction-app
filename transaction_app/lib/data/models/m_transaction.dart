import 'package:transaction_app/domain/entities/e_transaction.dart';

class MTransaction extends ETransaction {
  MTransaction({int transId, String name, int money, String type})
      : super(transId: transId, name: name, money: money, type: type);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'money': money,
      'type': type,
    };
  }

  MTransaction.fromData(Map<String, dynamic> json) {
    this.transId = json['id'];
    this.name = json['name'];
    this.money = json['money'];
    this.type = json['type'];
  }
}
