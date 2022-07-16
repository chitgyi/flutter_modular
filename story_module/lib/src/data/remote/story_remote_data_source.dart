import 'package:db_module/database.dart';

abstract class StoryRemoteDataSource {
  Future<List<Story>> getStories();
  Future<List<Transaction>> getTransactions();
}
