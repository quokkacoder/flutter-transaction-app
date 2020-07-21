import 'package:flutter/cupertino.dart';
import 'package:transaction_app/core/usecase/use_case.dart';
import 'package:transaction_app/domain/repositories/transaction_repo.dart';

class RemoveTransaction extends UseCaseNormal<bool, String> {
  final TransactionRepo transactionRepo;

  RemoveTransaction({@required this.transactionRepo});

  @override
  Future<bool> call(String params) async {
    return await transactionRepo.removeTransaction(int.parse(params));
  }
}
