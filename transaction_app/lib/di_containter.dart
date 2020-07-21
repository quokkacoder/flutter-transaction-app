import 'package:get_it/get_it.dart';
import 'package:transaction_app/core/database/tables/transaction_tab.dart';
import 'package:transaction_app/data/data_source/transaction_source_local.dart';
import 'package:transaction_app/data/repositories/transaction_repo_impl.dart';
import 'package:transaction_app/domain/repositories/transaction_repo.dart';

GetIt locator = GetIt.instance;

setUpLocator() {
  //! External
  locator.registerLazySingleton<TransactionTable>(() => TransactionTableImpl());

  // Data sources
  locator.registerLazySingleton<TransactionSourceLocal>(
          () => TransactionSourceImpl(table: locator()));

  // Repo
  locator.registerLazySingleton<TransactionRepo>(() => TransactionRepoImpl(
    sourceLocal: locator()
  ));
}
