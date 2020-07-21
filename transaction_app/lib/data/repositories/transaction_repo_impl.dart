import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:transaction_app/core/errors/exceptions.dart';
import 'package:transaction_app/core/errors/failures.dart';
import 'package:transaction_app/data/data_source/transaction_source_local.dart';
import 'package:transaction_app/data/models/m_transaction.dart';
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
    } on CacheException catch (e) {
      return Left(CacheFailure(mess: e.mess.toString()));
    }
  }

  @override
  Future<bool> removeTransaction(int id) async {
    return await sourceLocal.deleteTransaction(id);
  }

  @override
  Future<Either<Failures, bool>> addTransaction(
      MTransaction transaction) async {
    try {
      final result = await sourceLocal.insertTransaction(transaction);
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(mess: e.mess));
    }
  }
}
