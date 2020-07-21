import 'package:sqflite/sqflite.dart';
import 'package:transaction_app/core/database/appdb.dart';
import 'package:transaction_app/data/models/m_transaction.dart';

abstract class TransactionTable {
  static const TABLE_NAME = 'todo';
  static const CREATE_TABLE_QUERY = '''
      CREATE TABLE $TABLE_NAME(
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          name TEXT,
          money INTEGER,
          type VARCHAR(10)
      );
  ''';
  static const DROP_TABLE_QUERY = '''
      DROP TABLE IF EXISTS $TABLE_NAME;
  ''';

  Future<int> insert(MTransaction trans);

  Future<int> delete(int tranId);

  Future<bool> update(MTransaction newTran);

  Future<List<MTransaction>> selectAll({int limit = 40});
}

class TransactionTableImpl implements TransactionTable {
  @override
  Future<int> delete(int tranId) async {
    final db = await AppDb().database;

    return db.delete(TransactionTable.TABLE_NAME,
        where: 'id = ?', whereArgs: [tranId]);
  }

  @override
  Future<int> insert(MTransaction trans) async {
    final db = await AppDb().database;
    return db.insert(TransactionTable.TABLE_NAME, trans.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<List<MTransaction>> selectAll({int limit = 40}) async {
    final db = await AppDb().database;
    final maps = await db.query(TransactionTable.TABLE_NAME,
        orderBy: "id DESC", limit: limit);

    return List.generate(
        maps.length, (index) => MTransaction.fromData(maps[index]));
  }

  @override
  Future<bool> update(MTransaction newTran) {
    // TODO: implement update
    return null;
  }
}
