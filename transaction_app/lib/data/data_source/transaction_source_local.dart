import 'package:transaction_app/core/database/tables/transaction_tab.dart';
import 'package:transaction_app/core/errors/exceptions.dart';
import 'package:transaction_app/data/models/m_transaction.dart';

abstract class TransactionSourceLocal {
  Future<List<MTransaction>> fetchTransactions();

  Future<bool> deleteTransaction(int id);

  Future<bool> insertTransaction(MTransaction transaction);
}

class TransactionSourceImpl implements TransactionSourceLocal {
  final TransactionTable table;

  TransactionSourceImpl({this.table});

  @override
  Future<bool> deleteTransaction(int id) async {
    final result = await table.delete(id);
    print(result);
    if (result == 1) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<MTransaction>> fetchTransactions() async {
    try {
      return await table.selectAll();
    } catch (e) {
      throw CacheException(mess: 'Đã xảy ra lỗi $e');
    }
  }

  @override
  Future<bool> insertTransaction(MTransaction transaction) async {
    try {
      final transactionId = await table.insert(transaction);
      print(transactionId);
      if (transactionId > 0) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw CacheException(mess: 'Đã xảy ra lỗi $e}');
    }
  }
}
