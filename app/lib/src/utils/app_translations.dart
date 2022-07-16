import 'package:get/route_manager.dart';
import 'package:app/src/utils/app_module_entry.dart';

class AppTranslactions implements Translations {
  @override
  Map<String, Map<String, String>> get keys => AppModuleEntry().translations;
}
