import 'package:equatable/equatable.dart';

class ETransaction extends Equatable {
  int transId;
  String name;
  int money;
  String type;

  ETransaction({
    this.transId,
    this.name,
    this.money,
    this.type,
  });

  @override
  // TODO: implement props
  List<Object> get props => [transId, name, money, type];
}
