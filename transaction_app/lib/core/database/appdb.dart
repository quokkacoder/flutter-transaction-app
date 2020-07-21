import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:transaction_app/core/database/tables/transaction_tab.dart';

class AppDb {
  static const DB_NAME = "transaction.db";
  static const DB_VERSION = 4;
  static Database _database;

  static final AppDb _dbInstance = AppDb._internal();

  factory AppDb() => _dbInstance;

  AppDb._internal();

  static const initScripts = [TransactionTable.CREATE_TABLE_QUERY];
  static const migrationScripts = [TransactionTable.DROP_TABLE_QUERY];

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    return await openDatabase(join(await getDatabasesPath(), DB_NAME),
        version: DB_VERSION, onCreate: (db, version) {
      initScripts.forEach((script) => db.execute(script));
    }, onUpgrade: (db, oldV, newV) {
      migrationScripts.forEach((script) => db.execute(script));
      initScripts.forEach((script) => db.execute(script));
    });
  }
}
