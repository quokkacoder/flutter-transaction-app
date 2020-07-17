import 'package:transaction_app/core/database/tables/transaction_tab.dart';
import 'package:transaction_app/core/errors/exceptions.dart';
import 'package:transaction_app/data/models/m_transaction.dart';

abstract class TransactionSourceLocal{
  Future<List<MTransaction>> fetchTransactions();

  Future<bool> deleteTransaction(String id);
}

class TransactionSourceImpl implements TransactionSourceLocal{
  final TransactionTable table;

  TransactionSourceImpl({this.table});

  @override
  Future<bool> deleteTransaction(String id) async{
    final result = await table.delete(id);
    if(result == 1){
      return true;
    }else{
      return false;
    }
  }

  @override
  Future<List<MTransaction>> fetchTransactions() async {
    try {
      return await table.selectAll();
    }catch(e){
      throw CacheException(mess: 'Đã xảy ra lỗi');
    }
  }

}