import 'package:core_module/core_module.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class InitialInjections implements Bindings {
  @override
  void dependencies() {
    Get.put<ApiManager>(ApiManager(Dio()));
  }
}
