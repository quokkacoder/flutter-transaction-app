import 'package:transaction_app/domain/entities/e_transaction.dart';

class MTransaction extends ETransaction {
  Map<String, dynamic> toMap() {
    return {
      '_id': transId,
      'name': name,
      'money': money,
      'type': type,
    };
  }

  MTransaction.fromData(Map<String, dynamic> json) {
    this.transId = json['_id'];
    this.name = json['name'];
    this.money = json['money'];
    this.type = json['type'];
  }
}
