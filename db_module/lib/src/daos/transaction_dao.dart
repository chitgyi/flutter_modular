import 'package:db_module/database.dart';
import 'package:db_module/src/entities/transaction.dart';
import 'package:drift/drift.dart';

part 'transaction_dao.g.dart';

@DriftAccessor(tables: [Transactions])
class TransactionDao extends DatabaseAccessor<Database>
    with _$TransactionDaoMixin {
  TransactionDao(super.attachedDatabase);

  void insert(Transaction transaction) async {
    await into(transactions).insert(transaction);
  }

  Stream<List<Transaction>> watchTransactions() {
    return (select(transactions)).watch();
  }
}
