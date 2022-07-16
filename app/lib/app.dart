import 'package:app/injections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/src/utils/app_module_entry.dart';
import 'package:app/src/utils/app_translations.dart';

class ModularApp extends StatelessWidget {
  const ModularApp(this.entry, {Key? key}) : super(key: key);
  final AppModuleEntry entry;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialInjections(),
      initialRoute: entry.initialRouteName,
      getPages: entry.getPages,
      translations: AppTranslactions(),
    );
  }
}
