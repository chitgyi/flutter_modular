import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

abstract class Module {
  List<AppPage> get pages;

  Map<String, Map<String, String>> get translations;
}

class AppPage {
  final Widget Function() page;
  final String routeName;
  final Injector? injector;
  final bool isInitalRoute;

  AppPage({
    required this.page,
    required this.routeName,
    this.injector,
    this.isInitalRoute = false,
  });
}

abstract class ModuleEntry {
  List<AppPage> get appPages;
  List<Locale> get locales;
  Map<String, Map<String, String>> get translations;
  String get initialRouteName;
}
