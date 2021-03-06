import 'package:drift/drift.dart';

class Posts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  DateTimeColumn get createdAt => dateTime()
      .named('created_at')
      .nullable()
      .clientDefault(() => DateTime.now())();
}
