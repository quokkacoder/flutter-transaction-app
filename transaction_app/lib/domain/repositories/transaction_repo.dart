import 'package:dartz/dartz.dart';
import 'package:transaction_app/core/errors/failures.dart';
import 'package:transaction_app/data/models/m_transaction.dart';
import 'package:transaction_app/domain/entities/e_transaction.dart';

abstract class TransactionRepo {
  Future<Either<Failures, List<ETransaction>>> fetchTransactions();

  Future<bool> removeTransaction(int id);

  Future<Either<Failures, bool>> addTransaction(MTransaction transaction);
}
