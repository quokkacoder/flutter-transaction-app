import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:transaction_app/core/errors/failures.dart';
import 'package:transaction_app/core/usecase/use_case.dart';
import 'package:transaction_app/domain/entities/e_transaction.dart';
import 'package:transaction_app/domain/repositories/transaction_repo.dart';

class FetchTransaction extends UseCaseEither<List<ETransaction>, NoParam> {
  final TransactionRepo transactionRepo;

  FetchTransaction({@required this.transactionRepo});

  @override
  Future<Either<Failures, List<ETransaction>>> call(NoParam params) async {
    return await transactionRepo.fetchTransactions();
  }
}
