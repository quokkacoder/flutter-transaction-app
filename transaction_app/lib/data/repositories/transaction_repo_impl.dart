import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:transaction_app/core/errors/exceptions.dart';
import 'package:transaction_app/core/errors/failures.dart';
import 'package:transaction_app/data/data_source/transaction_source_local.dart';
import 'package:transaction_app/domain/entities/e_transaction.dart';
import 'package:transaction_app/domain/repositories/transaction_repo.dart';

class TransactionRepoImpl implements TransactionRepo {
  final TransactionSourceLocal sourceLocal;

  TransactionRepoImpl({@required this.sourceLocal});

  @override
  Future<Either<Failures, List<ETransaction>>> fetchTransactions() async {
    try {
      final transactions = await sourceLocal.fetchTransactions();
      return Right(transactions);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<bool> removeTransaction(String id) async {
    return await sourceLocal.deleteTransaction(id);
  }
}
