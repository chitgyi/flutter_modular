import 'package:core_module/core_module.dart';
import 'package:get/instance_manager.dart';

class InjectorBindings implements Bindings {
  final Injector? injector;
  InjectorBindings(this.injector);

  @override
  void dependencies() {
    if (injector != null) {
      injector!.inject();
    }
  }
}
