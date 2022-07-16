import 'package:core_module/src/database/daos/daos.dart';
import 'package:core_module/src/database/database.dart';

class DatabaseModule {
  static final DatabaseModule _instance = DatabaseModule._();
  DatabaseModule._() : _database = Database();
  factory DatabaseModule() => _instance;

  late final Database _database;

  StoryDao get storyDao => _database.storyDaoImpl;

  PostDao get postDao => _database.postDaoImpl;
}
