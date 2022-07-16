import 'dart:io';

import 'package:db_module/src/daos/story_dao.dart';
import 'package:db_module/src/daos/transaction_dao.dart';
import 'package:db_module/src/entities/story.dart';
import 'package:db_module/src/entities/transaction.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Stories,
    Transactions,
  ],
  daos: [
    StoryDao,
    TransactionDao,
  ],
)
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
