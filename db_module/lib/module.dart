import 'package:db_module/database.dart';

class DatabaseModule {
  static final DatabaseModule _instance = DatabaseModule._();
  DatabaseModule._() : database = Database();
  factory DatabaseModule() => _instance;

  late final Database database;
}
