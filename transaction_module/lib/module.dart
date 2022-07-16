import 'package:core_module/core_module.dart';
import 'package:transaction_module/generated/locales.g.dart';
import 'package:transaction_module/src/pages/transaction_details_page.dart';
import 'package:transaction_module/src/pages/transaction_list_page.dart';
import 'package:transaction_module/src/utils/routes.dart';

class TransactionModule implements Module {
  @override
  List<AppPage> get pages => [
        AppPage(
          page: () => const TransactionListPage(),
          routeName: TransactionRoutes.transactions,
          isInitalRoute: true,
        ),
        AppPage(
          page: () => const TransactionDetailsPage(),
          routeName: TransactionRoutes.transactionDetails,
        ),
      ];

  @override
  Map<String, Map<String, String>> get translations =>
      AppTranslation.translations;
}
