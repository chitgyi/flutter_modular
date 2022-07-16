import 'package:app/src/utils/app_module_entry.dart';
import 'package:flutter/material.dart';
import 'package:app/app.dart';
import 'package:story_module/module.dart';
import 'package:transaction_module/transaction_module.dart';

void main() {
  final entry = AppModuleEntry();
  entry.addModule(StoryModule());
  entry.addModule(TransactionModule());
  runApp(ModularApp(entry));
}
