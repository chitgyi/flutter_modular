import 'package:drift/drift.dart';

@DataClassName('Story')
class Stories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get description => text()();
  TextColumn get image => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now()).nullable()();
}
