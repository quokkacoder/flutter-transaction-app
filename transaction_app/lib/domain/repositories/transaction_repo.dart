import 'package:dartz/dartz.dart';
import 'package:transaction_app/core/errors/failures.dart';
import 'package:transaction_app/domain/entities/e_transaction.dart';

abstract class TransactionRepo{
  Future<Either<Failures, List<ETransaction>>> fetchTransactions();
  Future<bool> removeTransaction(String id);
}