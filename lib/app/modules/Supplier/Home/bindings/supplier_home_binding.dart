import 'package:get/get.dart';

import '../controllers/supplier_home_controller.dart';

class SupplierHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupplierHomeController>(
      () => SupplierHomeController(),
    );
  }
}
