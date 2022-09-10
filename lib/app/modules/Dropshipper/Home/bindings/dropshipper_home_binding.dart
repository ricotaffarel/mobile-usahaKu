import 'package:get/get.dart';

import '../controllers/dropshipper_home_controller.dart';

class DropshipperHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DropshipperHomeController>(
      () => DropshipperHomeController(),
    );
  }
}
