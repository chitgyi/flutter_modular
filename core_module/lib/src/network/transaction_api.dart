import 'package:retrofit/retrofit.dart';

abstract class TransactionApi {
  @GET("/transactions")
  Future<HttpResponse> getTransactions();
}
