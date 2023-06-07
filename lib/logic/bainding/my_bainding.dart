import 'package:get/get.dart';

import '../themes_changer.dart';
import '../user_controller.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemModeChange());
    Get.lazyPut(() => UserController());
  }
}
