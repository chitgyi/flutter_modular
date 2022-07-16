import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:story_module/story_module.dart';
import 'package:transaction_module/src/utils/routes.dart';

class TransactionListPage extends StatelessWidget {
  const TransactionListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transaction List")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: null,
            tooltip: 'Transactions',
            onPressed: () => Get.toNamed(TransactionRoutes.transactionDetails),
            child: const Icon(Icons.info),
          ),
          FloatingActionButton(
            tooltip: 'Stories',
            heroTag: null,
            onPressed: () => Get.toNamed(StoryRoutes.stories),
            child: const Icon(Icons.newspaper),
          ),
        ],
      ),
      body: const Center(
        child: Text("Transaction List Page"),
      ),
    );
  }
}
