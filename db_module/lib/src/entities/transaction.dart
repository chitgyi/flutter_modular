import 'package:drift/drift.dart';

@DataClassName('Transaction')
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get trxID => text().withLength(min: 1, max: 255)();
  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get description => text()();
  DateTimeColumn get date => dateTime()();
}
