import 'package:app/src/utils/injecto2bindings.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppModuleEntry implements ModuleEntry {
  static final _instance = AppModuleEntry._();
  AppModuleEntry._();
  factory AppModuleEntry() => _instance;

  final List<Module> _modules = [];

  void addModule(Module module) {
    _modules.add(module);
  }

  @override
  List<AppPage> get appPages => _modules
      .map((e) => e.pages)
      .reduce((value, element) => value..addAll(element));

  List<GetPage> get getPages => appPages
      .map(
        (e) => GetPage(
          name: e.routeName,
          page: e.page,
          binding: InjectorBindings(e.injector),
        ),
      )
      .toList();

  @override
  String get initialRouteName => appPages
      .firstWhere(
        (element) => element.isInitalRoute,
        orElse: () => appPages.first,
      )
      .routeName;

  @override
  List<Locale> get locales =>
      _localeCodes.map((e) => Locale(e.toLowerCase())).toList();

  @override
  Map<String, Map<String, String>> get translations {
    final translations = <String, Map<String, String>>{};
    for (var langCode in _localeCodes) {
      for (var element in _modules) {
        if (element.translations.containsKey(langCode)) {
          translations[langCode] = element.translations[langCode] ?? {};
        }
      }
    }
    return translations;
  }

  Set<String> get _localeCodes => _modules
      .map((e) => e.translations.keys)
      .reduce((e, f) => e.toList()..addAll(f))
      .toSet();
}
