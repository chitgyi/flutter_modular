import 'package:core_module/core_module.dart';
import 'package:db_module/database.dart';
import 'package:db_module/module.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class InitialInjections implements Bindings {
  @override
  void dependencies() {
    Get.put<Database>(DatabaseModule().database);
    Get.put<ApiManager>(ApiManager(Dio()));
  }
}
